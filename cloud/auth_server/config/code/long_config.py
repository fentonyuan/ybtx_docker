import sys

try:
    # 没有策略文件，直接返回空策略
    print("ACK-COUNT=1")
    print("CURRENT-ACK=1")
    print("Reply-Message += 'END'")
    sys.exit(0)

except Exception as e:
    sys.stderr.write(f"ERROR: {str(e)}\n")
    sys.exit(1)