#!/bin/bash
# 自动为没有 front matter 的 markdown 文件添加布局

if [ $# -eq 0 ]; then
    echo "用法: $0 <文件路径>"
    echo "或者: $0 <目录路径> (处理目录下所有 .md 文件)"
    exit 1
fi

add_front_matter() {
    local file="$1"
    
    # 检查文件是否已经包含 front matter
    if head -n 3 "$file" | grep -q '^---$'; then
        echo "文件 $file 已包含 front matter，跳过处理"
        return
    fi
    
    # 创建临时文件
    local temp_file=$(mktemp)
    
    # 添加 front matter
    echo "---" > "$temp_file"
    echo "layout: post" >> "$temp_file"
    echo "---" >> "$temp_file"
    echo "" >> "$temp_file"
    
    # 添加原文件内容
    cat "$file" >> "$temp_file"
    
    # 移动临时文件到原位置
    mv "$temp_file" "$file"
    
    echo "已为 $file 添加 front matter"
}

if [ -d "$1" ]; then
    # 处理目录中的所有 .md 文件
    find "$1" -name "*.md" -o -name "*.markdown" | while read -r file; do
        add_front_matter "$file"
    done
else
    # 处理单个文件
    add_front_matter "$1"
fi