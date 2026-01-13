#!/bin/bash

# 一鍵安裝: curl -fsSL https://raw.githubusercontent.com/lian1112/myLinuxDotfile/main/install.sh | bash

set -e

DOTFILES_DIR="$HOME/myLinuxDotfile"
REPO_URL="https://github.com/lian1112/myLinuxDotfile.git"

echo "=== Dotfiles 安裝腳本 ==="

# 1. Clone repo (如果不存在)
if [ -d "$DOTFILES_DIR" ]; then
    echo "更新現有 repo..."
    cd "$DOTFILES_DIR" && git pull
else
    echo "Clone dotfiles repo..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

# 2. 備份現有檔案
backup_if_exists() {
    local file="$1"
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        echo "備份 $file -> ${file}.backup"
        mv "$file" "${file}.backup"
    fi
}

backup_if_exists "$HOME/.vimrc"
backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.tmux.conf"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.bashrc"

# 3. 建立 symlinks
ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

echo ""
echo "Dotfiles 已安裝:"
ls -la ~/.vimrc ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.bashrc 2>/dev/null | awk '{print "  " $9 " -> " $11}'

# 4. 檢查 oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo ""
    echo "oh-my-zsh 未安裝，要安裝嗎? (y/N)"
    read -r ans
    if [[ "$ans" =~ ^[Yy]$ ]]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        # 安裝 zsh plugins
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true
        git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true
    fi
fi

echo ""
echo "=== 安裝完成 ==="
echo "執行 'source ~/.zshrc' 或重新登入生效"
