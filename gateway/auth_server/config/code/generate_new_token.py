#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import json
import base64
import zlib
import time
import redis
import os
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives.serialization import load_pem_public_key
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, serialization

# 配置路径和 Redis
private_key_path = '/etc/freeradius/3.0/keys/private_key.pem'

def generate_token(token_b64):
    try:
        # 解码和解压
        padding = "=" * ((4 - len(token_b64) % 4) % 4)
        compressed_data = base64.urlsafe_b64decode(token_b64 + padding)
        json_data = zlib.decompress(compressed_data)
        data = json.loads(json_data)

        # 提取字段
        device_id = data["device_id"]
        timestamp = data["timestamp"]
        expiry = data["expiry"]

        nonce_bytes = os.urandom(4)  # 生成随机 nonce（4字节）
        nonce_b64 = base64.urlsafe_b64encode(nonce_bytes).decode().rstrip("=")

        data = {
            "device_id": device_id,
            "timestamp": timestamp,
            "expiry": expiry,
            "nonce": nonce_b64
        }

       # 读取私钥并签名
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

if __name__ == "__main__":
    token = sys.argv[1] if len(sys.argv) > 1 else ""
    # token = 'eNotjN1ugjAYQN_lu5WEVoQy7hybplO2gDE6bkwjX7HyMwMtdFv27sPEu5OTnPMLBQ7qjCdVQDSxFKbWp4czPXYUHNCqwV6L5gYRZQvmBQtGQwfQ3lT3DVFAiAPtV3vGaaG3ufHLKepV2QpturtMXj9jnsZeLbPN8zXOuTy-VCFKd0bVwfCPysqxoj9P7spiEe7995JflpuxO_p2OZ8P6ZCMmjXEUyKhfi1s9kaIt66DK2HItzsNf_-7xECw'
    generate_token(token)
