# Cursor 重置工具包

一键清理、安装、配置 Cursor 的完整方案。

A complete toolkit to fully reset Cursor on macOS. Run `cleanup-cursor.sh` to wipe all user data, caches, and configs, restoring Cursor to a fresh install state. Then run `install-cursor.sh` to reinstall Cursor via Homebrew with necessary extensions. One command to do it all: `./cleanup-cursor.sh && ./install-cursor.sh`. Useful when you want a clean slate, troubleshoot issues, or switch accounts.

## 文件说明

| 文件 | 用途 |
|------|------|
| `cleanup-cursor.sh` | 清理 Cursor 所有数据和缓存 |
| `install-cursor.sh` | 安装 Cursor 及必要扩展 |
| `README.md` | 本说明文件 |

## 快速使用

### 1. 清理（重置 Cursor 到初始状态）
```bash
./cleanup-cursor.sh
```
清理以下目录：
- `~/Library/Application Support/Cursor` — 主数据（设置、扩展、工作区历史）
- `~/.cursor` — 配置文件
- `~/Library/Caches/Cursor` — 缓存
- `~/Library/Preferences/com.cursor.*` — 偏好设置
- `~/Library/Saved Application State/com.cursor.*` — 应用状态
- `~/Library/HTTPStorages/com.cursor.*` — HTTP 存储

### 2. 安装（安装 Cursor + 扩展）
```bash
./install-cursor.sh
```
- 通过 Homebrew 安装 Cursor
- 自动安装 cursorpromax 扩展

### 3. 完整重置流程（清理 → 安装）
```bash
./cleanup-cursor.sh && ./install-cursor.sh
```

## 注意事项
- ⚠️ 清理操作不可逆，会删除所有 Cursor 本地数据
- ⚠️ 清理前请先退出 Cursor（脚本会自动检测）
- ⚠️ 安装脚本需要 Homebrew
