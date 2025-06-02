import os
import json
import time
from pathlib import Path
from datetime import datetime

# =======================
# 配置参数
# =======================
SOURCE_DIR = Path("/home/gateway_config")
OUTPUT_FILE = Path("/home/output/police.json")


combined_data = []

# =======================
# 遍历目录并筛选 JSON 文件
# =======================
for json_file in SOURCE_DIR.glob("*.json"):
    try:
        with open(json_file, 'r', encoding='utf-8') as f:
            data = json.load(f)
            combined_data.append(data)
        # 删除已读取文件
        json_file.unlink()
    except Exception:
        pass  # 忽略错误文件

# =======================
# 写入合并结果到输出文件
# =======================
try:
    OUTPUT_FILE.parent.mkdir(parents=True, exist_ok=True)
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f_out:
        json.dump(combined_data, f_out, ensure_ascii=False, indent=4)
        # print("success")
except Exception:
    pass