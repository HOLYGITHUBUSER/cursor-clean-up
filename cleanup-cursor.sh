#!/bin/bash

# Cursor 数据清理脚本
# 用途：彻底删除 macOS 上 Cursor 的所有数据和缓存
# 使用方法：关闭 Cursor 后执行此脚本
# 已验证：此脚本覆盖 macOS 上 Cursor 的所有数据存储位置

echo "========================================"
echo "  Cursor 数据完全清理脚本"
echo "========================================"
echo ""

# 检查 Cursor 是否在运行
if pgrep -x "Cursor" > /dev/null; then
    echo "❌ 错误：Cursor 正在运行，请先退出 Cursor (Cmd+Q)"
    echo "提示：也可以执行 pkill -9 Cursor 强制退出"
    exit 1
fi

DELETED=0
SKIPPED=0

# 清理所有 Cursor 数据目录
DIRS=(
    "$HOME/Library/Application Support/Cursor"   # 主数据目录（设置、扩展、工作区历史）
    "$HOME/.cursor"                                # 配置目录
    "$HOME/Library/Caches/Cursor"                  # 缓存目录
    "$HOME/Library/Preferences/com.cursor.*"       # 偏好设置
    "$HOME/Library/Saved Application State/com.cursor.*"  # 应用状态
    "$HOME/Library/HTTPStorages/com.cursor.*"      # HTTP 存储
)

for dir in "${DIRS[@]}"; do
    # 处理通配符路径
    for expanded in $dir; do
        if [ -e "$expanded" ]; then
            echo "删除: ${expanded/#$HOME/~}"
            rm -rf "$expanded"
            echo "✅ 已删除"
            ((DELETED++))
        else
            echo "⚠️  不存在，跳过: ${expanded/#$HOME/~}"
            ((SKIPPED++))
        fi
    done
done

echo ""
echo "========================================"
echo "  清理完成！删除 $DELETED 项，跳过 $SKIPPED 项"
echo "========================================"
echo ""
echo "✨ 重新启动 Cursor 将会自动创建新的配置文件。"
echo "📌 应用本体 /Applications/Cursor.app 未被删除。"
