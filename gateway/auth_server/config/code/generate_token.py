#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import json
import time
import base64
import zlib  # 新增压缩模块
import os
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.backends import default_backend

# 确保传入了正确数量的参数
if len(sys.argv) < 3:
    print("ERROR: Missing arguments", file=sys.stderr)
    sys.exit(1)

user_name = sys.argv[1]  # 获取 User-Name
nas_ip = sys.argv[2]  # 获取 NAS-IP-Address

# 定义一个映射关系，将 NAS-IP-Address 转换为 device_id
device_map = {
    "192.168.1.1": "device_A",
    "10.1.161.27": "device_B"
}
device_id = device_map.get(nas_ip, f"{user_name}")  # 若找不到，使用默认值

private_key_path = '/etc/freeradius/3.0/keys/private_key.pem'

# 生成数据
timestamp = int(time.time())
expiry = 30 * 24 * 60 * 60
nonce_bytes = os.urandom(4)  # 生成随机 nonce（4字节）
nonce_b64 = base64.urlsafe_b64encode(nonce_bytes).decode().rstrip("=")
data = {
    "device_id": device_id,
    "timestamp": timestamp,
    "expiry": expiry,
    "nonce": nonce_b64
}

# 读取私钥并签名
try:
    with open(private_key_path, "rb") as f:
        private_key = serialization.load_pem_private_key(
            f.read(),
            password=None,
            backend=default_backend(),
        )

    # 确保私钥是 EC 类型
    if not isinstance(private_key, ec.EllipticCurvePrivateKey):
        raise ValueError("Private key is not an EC key")

    # 计算签名（不包含 `signature` 字段）
    signature = private_key.sign(
        json.dumps(data, separators=(",", ":")).encode(),  # 紧凑 JSON
        # json.dumps(data, sort_keys=True).encode(),
        ec.ECDSA(hashes.SHA256())
    )

    # 进行 Base64 编码
    data["signature"] = base64.b64encode(signature).decode().rstrip("=")

   # JSON 序列化并压缩
    json_data = json.dumps(data, separators=(",", ":")).encode()  # 更紧凑的 JSON
    compressed_data = zlib.compress(json_data, level=9)

    # Base64（URL 安全，去掉填充）
    token_b64 = base64.urlsafe_b64encode(compressed_data).decode().rstrip("=")

    # token_b64 = base64.b64encode(json.dumps(data).encode()).decode()

    print('Token := "{}"'.format(token_b64))

except Exception as e:
    print("ERROR: {}".format(e), file=sys.stderr)
    sys.exit(1)