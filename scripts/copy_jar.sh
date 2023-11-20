#!/bin/bash

# ��ȡ�ű�����Ŀ¼�ľ���·��
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ת����Ŀ��Ŀ¼
cd "$SCRIPT_DIR/.."

# ����Ŀ¼���ڴ�����е�jar��
mkdir -p package

# ʹ�� find ����������ĿĿ¼�����е�jar�ļ�
find . -type f -name "*.jar" | while read -r jar_file; do
    # ��ȡjar�ļ���
    jar_name=$(basename "$jar_file")

    # ����jar�ļ���jarsĿ¼��
    cp -v "$jar_file" "package/$jar_name"
done

tar -czvf package/sermant-examples-$*.tar.gz package/*