#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import json
import base64
import zlib
import time
import redis
import os
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import ec
from cryptography.hazmat.primitives.serialization import load_pem_public_key
from cryptography.hazmat.backends import default_backend

# 配置路径和 Redis
public_key_path = "/etc/freeradius/3.0/keys/public_key.pem"

def verify_token(token_b64):
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
        nonce = data["nonce"]
        signature_b64 = data.pop("signature")

        # 过期校验
        if time.time() > timestamp + expiry:
            print("expired")
            return

        # Redis 防重放
        r = redis.Redis(host="127.0.0.1", port=6379, db=0)
        redis_key = f"token_nonce:{nonce}"
        if r.get(redis_key):
            print("replay_attack",nonce)
            exit(1)
        else:
            r.set(redis_key, "1", ex=300)  # 设置 5 分钟有效期

        # 加载公钥
        with open(public_key_path, "rb") as f:
            public_key = load_pem_public_key(f.read(), backend=default_backend())

        # 还原消息内容（去掉 signature 后的 JSON）
        message = json.dumps(data, separators=(",", ":")).encode()

        # 处理 Base64 补齐
        signature = base64.urlsafe_b64decode(signature_b64 + "=" * ((4 - len(signature_b64) % 4) % 4))

        # 验证签名
        try:
            public_key.verify(signature, message, ec.ECDSA(hashes.SHA256()))
            print("ok")
        except Exception as e:
            print("invalid_signature")
            return

    except Exception as e:
        print("error:", str(e))

if __name__ == "__main__":
    token = sys.argv[1] if len(sys.argv) > 1 else ""
    # token = 'eNoVy8kOQ0AYAOB3-c-SWsrgNkRRS0QzKb00lqnOgRFb0PTdq9cv-T5Q04VV9MlqMGEe6SCBABNr6TgVbQ-mhM5IQaqhaALQtWfDBqYmigJ0vKvocV4uRgQfaWRNV0zz8MfIIbaPXRTraWbfT7gP_UhKHrSO1oUEMTessHROnDGveW-oDTFz8K4Gcl2lilpmurclVUhkg2sNcudrV1i35bKTwsm5spY5fH-e2Tnp'
    verify_token(token)
