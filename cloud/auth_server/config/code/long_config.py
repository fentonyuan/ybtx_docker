import json
import base64
import sys
import os

try:
    json_file = "/home/output/police.json"
    
    if os.path.getsize(json_file) == 0:
        print("ACK-COUNT=1")
        print("CURRENT-ACK=1")
        print("Reply-Message += 'END'")
        sys.exit(0)
    # 读取 JSON 并编码
    with open(json_file, "r", encoding="utf-8") as f:
        data = json.load(f)

    # if not data:  # 如果 JSON 为空
    #     print("ACK-COUNT=0")
    #     print("CURRENT-ACK=0")
    #     print("Reply-Message += 'END'")
    #     sys.exit(0)

    json_str = json.dumps(data, ensure_ascii=False)
    encoded_str = base64.b64encode(json_str.encode("utf-8")).decode("utf-8")

    # 分块
    chunk_size = 220  
    chunks = [encoded_str[i:i + chunk_size] for i in range(0, len(encoded_str), chunk_size)]
    total_chunks = len(chunks)

    # 计算 ACK 数量
    max_messages_per_ack = 10  
    total_acks = (total_chunks + max_messages_per_ack - 1) // max_messages_per_ack

    # **获取当前 ACK 序号**
    current_ack = int(sys.argv[1]) if len(sys.argv) > 1 else 1
    # print(f"sys.argv: {sys.argv}")
    # print(f"当前 ACK: {current_ack}")

    # **计算当前需要发送的分片**
    start_idx = (current_ack - 1) * max_messages_per_ack
    end_idx = min(start_idx + max_messages_per_ack, total_chunks)

    # **发送序号**
    print(f"ACK-COUNT={total_acks}")
    print(f"CURRENT-ACK={current_ack}")
    
    # **如果是第一条，发送 START**
    if current_ack == 1:
        print("Reply-Message += 'START'")

    # **发送当前批次的数据**
    print(f"Reply-Message += 'Seq:{current_ack}/{total_acks}'")
    for idx in range(start_idx, end_idx):
        print(f"Reply-Message += 'B64{idx:03d}{chunks[idx]}'")

    # **如果是最后一条，发送 END**
    if current_ack == total_acks:
        print("Reply-Message += 'END'")
         # 清空文件
        with open(json_file, 'w', encoding='utf-8') as f:
            f.truncate(0)

except Exception as e:
    sys.stderr.write(f"ERROR: {str(e)}\n")
    sys.exit(1)
