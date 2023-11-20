#!/bin/bash

# 获取脚本所在目录的绝对路径
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 转到项目根目录
cd "$SCRIPT_DIR/.."

# 创建目录用于存放所有的jar包
mkdir -p package

# 使用 find 命令搜索项目目录下所有的jar文件
find . -type f -name "*.jar" | while read -r jar_file; do
    # 获取jar文件名
    jar_name=$(basename "$jar_file")

    # 复制jar文件到jars目录下
    cp -v "$jar_file" "package/$jar_name"
done

tar -czvf package/sermant-examples-$*.tar.gz package/*