#!/bin/bash

# 配置檔目錄
DOTFILES_DIR="$HOME/myLinuxDotfile"

# 建立符號連結
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"

echo "✓ .vimrc 連結完成"
echo "✓ .zshrc 連結完成"
echo ""
echo "配置檔已安裝完成！"
