#!/bin/bash

# 一鍵安裝: curl -fsSL https://raw.githubusercontent.com/lian1112/myLinuxDotfile/main/install.sh | bash

set -e

DOTFILES_DIR="$HOME/myLinuxDotfile"
REPO_URL="https://github.com/lian1112/myLinuxDotfile.git"

echo "=== Dotfiles 一鍵安裝 ==="

# 檢測套件管理器
install_pkg() {
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y "$@"
    elif command -v yum &>/dev/null; then
        sudo yum install -y "$@"
    elif command -v pacman &>/dev/null; then
        sudo pacman -S --noconfirm "$@"
    elif command -v brew &>/dev/null; then
        brew install "$@"
    else
        echo "無法識別套件管理器，請手動安裝: $@"
        return 1
    fi
}

# 1. 安裝基本工具
echo ""
echo "[1/5] 檢查並安裝基本工具..."
PACKAGES=""
command -v git &>/dev/null || PACKAGES="$PACKAGES git"
command -v zsh &>/dev/null || PACKAGES="$PACKAGES zsh"
command -v tmux &>/dev/null || PACKAGES="$PACKAGES tmux"
command -v vim &>/dev/null || PACKAGES="$PACKAGES vim"
command -v curl &>/dev/null || PACKAGES="$PACKAGES curl"
command -v xclip &>/dev/null || PACKAGES="$PACKAGES xclip"

if [ -n "$PACKAGES" ]; then
    echo "安裝: $PACKAGES"
    install_pkg $PACKAGES
else
    echo "基本工具已安裝"
fi

# 2. Clone dotfiles repo
echo ""
echo "[2/5] 設定 dotfiles repo..."
if [ -d "$DOTFILES_DIR" ]; then
    echo "更新現有 repo..."
    cd "$DOTFILES_DIR" && git pull
else
    echo "Clone dotfiles repo..."
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

# 3. 安裝 oh-my-zsh
echo ""
echo "[3/5] 設定 oh-my-zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "安裝 oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# 安裝 zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "安裝 zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "安裝 zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 4. 備份並建立 symlinks
echo ""
echo "[4/5] 建立 dotfiles symlinks..."
backup_if_exists() {
    local file="$1"
    if [ -f "$file" ] && [ ! -L "$file" ]; then
        echo "  備份 $file -> ${file}.backup"
        mv "$file" "${file}.backup"
    fi
}

backup_if_exists "$HOME/.vimrc"
backup_if_exists "$HOME/.zshrc"
backup_if_exists "$HOME/.tmux.conf"
backup_if_exists "$HOME/.gitconfig"
backup_if_exists "$HOME/.bashrc"

ln -sf "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/bashrc" "$HOME/.bashrc"

echo "  .vimrc -> dotfiles"
echo "  .zshrc -> dotfiles"
echo "  .tmux.conf -> dotfiles"
echo "  .gitconfig -> dotfiles"
echo "  .bashrc -> dotfiles"

# 5. 設定預設 shell
echo ""
echo "[5/5] 設定預設 shell..."
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "將預設 shell 改為 zsh..."
    chsh -s "$(which zsh)" || echo "chsh 失敗，請手動執行: chsh -s \$(which zsh)"
else
    echo "預設 shell 已是 zsh"
fi

echo ""
echo "=== 安裝完成 ==="
echo ""
echo "已安裝:"
echo "  - git, zsh, tmux, vim, curl, xclip"
echo "  - oh-my-zsh + plugins (autosuggestions, syntax-highlighting)"
echo "  - dotfiles (vimrc, zshrc, tmux.conf, gitconfig, bashrc)"
echo ""
echo "重新登入或執行 'zsh' 開始使用"
