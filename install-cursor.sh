#!/bin/bash

# Cursor 安装脚本
# 用途：在 macOS 上安装 Cursor 编辑器
# 使用方法：直接执行此脚本

echo "========================================"
echo "  Cursor 安装脚本"
echo "========================================"
echo ""

# 检查是否已安装
if [ -d "/Applications/Cursor.app" ]; then
    echo "⚠️  检测到 Cursor 已安装在 /Applications/Cursor.app"
    read -p "是否重新安装？(y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "已取消安装。"
        exit 0
    fi
    echo "卸载现有 Cursor..."
    brew uninstall --cask cursor 2>/dev/null
    rm -rf /Applications/Cursor.app
fi

# 检查 Homebrew
if ! command -v brew &> /dev/null; then
    echo "❌ 未检测到 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 安装 Cursor
echo "正在通过 Homebrew 安装 Cursor..."
brew install --cask cursor

# 验证安装
if [ -d "/Applications/Cursor.app" ]; then
    echo ""
    echo "✅ Cursor 安装成功！"
    echo ""

    # 安装 cursorpromax 扩展
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    VSIX_FILE="$SCRIPT_DIR/cursorpromax-1.1.4.vsix"
    if [ -f "$VSIX_FILE" ]; then
        echo "正在安装 cursorpromax 扩展..."
        cursor --install-extension "$VSIX_FILE"
        echo "✅ cursorpromax 扩展安装成功！"
    else
        echo "⚠️  未找到 cursorpromax-1.1.4.vsix，跳过扩展安装"
    fi

    echo ""
    echo "========================================"
    echo "  ✅ 全部安装完成！"
    echo "========================================"
    echo ""
    echo "📌 安装位置: /Applications/Cursor.app"
    echo "📌 启动方式: open /Applications/Cursor.app"
else
    echo ""
    echo "❌ 安装可能失败，请检查上方日志。"
    echo "手动安装: 访问 https://cursor.com/download 下载"
fi
