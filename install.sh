#!/bin/bash

# 配置檔目錄
DOTFILES_DIR="$HOME/myLinuxDotfile"

# 建立符號連結
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

echo "Dotfiles installed:"
echo "  .vimrc -> $DOTFILES_DIR/vimrc"
echo "  .zshrc -> $DOTFILES_DIR/zshrc"
echo "  .tmux.conf -> $DOTFILES_DIR/tmux.conf"
echo "  .gitconfig -> $DOTFILES_DIR/gitconfig"
echo "  .bashrc -> $DOTFILES_DIR/bashrc"
