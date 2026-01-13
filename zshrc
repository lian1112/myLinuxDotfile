# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# 讓多個終端機視窗共享歷史紀錄
#setopt SHARE_HISTORY

# 指令執行完立刻寫入檔案，而不是等關閉視窗才寫
setopt INC_APPEND_HISTORY

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="random"
ZSH_THEME="maran"
#ZSH_THEME="afowler"
#ZSH_THEME="candy-kingdom"
#ZSH_THEME="simple"
#ZSH_THEME="macovsky"
#candy-kingdom'
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# 禁用 oh-my-zsh 自動設定 title（避免覆蓋 Claude Code 的對話名稱）
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#export JAVA_HOME_21_X64=/usr/lib/jvm/java-21-openjdk-amd64/bin/java
#export JAVA_HOME=/usr/lib/jvm/java-23-openjdk-amd64
#export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
#export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

plugins=(git history-substring-search zsh-autosuggestions vi-mode zsh-syntax-highlighting)
#export PATH="$JAVA_HOME/bin:/usr/bin:/home/allenl/polaris/synopsys-bridge-linux64-2.9.0:$PATH"
export PATH="$JAVA_HOME/bin:/usr/bin:/home/allenl/dockerMount/cov-analysis-linux64-2025.3.0/bin/:$PATH"

source $ZSH/oh-my-zsh.sh

bindkey '^[[H' beginning-of-line # Home
bindkey '^[[F' end-of-line # End
bindkey '^[[2~' overwrite-mode # Insert
bindkey '^[[3~' delete-char # Delete
bindkey '^?' backward-delete-char # Backspace
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export SEEKER_HOME_DIR=/home/allenl/seeker20241000/data





export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# 將這個函數加入到你的 ~/.zshrc 檔案中

# 執行剪貼板內容的函數（支援長指令和多行命令）
runclip() {
    # 檢查作業系統並獲取剪貼板內容
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        clipboard_content=$(pbpaste)
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Linux (需要 xclip 或 xsel)
        if command -v xclip &> /dev/null; then
            clipboard_content=$(xclip -selection clipboard -o)
        elif command -v xsel &> /dev/null; then
            clipboard_content=$(xsel --clipboard --output)
        else
            echo "錯誤：請先安裝 xclip 或 xsel"
            echo "Ubuntu/Debian: sudo apt-get install xclip"
            echo "Fedora: sudo dnf install xclip"
            return 1
        fi
    else
        echo "錯誤：不支援的作業系統"
        return 1
    fi
    
    # 檢查剪貼板是否為空
    if [[ -z "$clipboard_content" ]]; then
        echo "錯誤：剪貼板是空的"
        return 1
    fi
    
    # 計算命令資訊
    line_count=$(echo "$clipboard_content" | wc -l | tr -d ' ')
    char_count=$(echo -n "$clipboard_content" | wc -c | tr -d ' ')
    
    # 顯示即將執行的命令
    echo "即將執行以下命令 (共 $line_count 行, $char_count 字元)："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # 如果命令太長，只顯示部分內容
    if [[ $line_count -gt 20 ]] || [[ $char_count -gt 1000 ]]; then
        echo "$clipboard_content" | head -n 10
        echo "... (中間省略) ..."
        echo "$clipboard_content" | tail -n 5
    else
        echo "$clipboard_content"
    fi
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # 詢問確認（安全性考量）
    echo -n "確定要執行嗎？ (y/N) "
    read -r response
    
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "執行中..."
        echo ""
        
        # 創建臨時檔案來執行命令（更可靠的方式處理長命令）
        temp_script=$(mktemp /tmp/runshell.XXXXXX)
        echo "$clipboard_content" > "$temp_script"
        chmod +x "$temp_script"
        
        # 執行臨時腳本（使用 zsh 並載入環境）
        zsh -c "source ~/.zshrc; source $temp_script"
        exit_code=$?
        
        # 清理臨時檔案
        rm -f "$temp_script"
        
        # 顯示執行結果
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        if [[ $exit_code -eq 0 ]]; then
            echo "✅ 執行完成 (退出碼: 0)"
        else
            echo "❌ 執行失敗 (退出碼: $exit_code)"
        fi
        
        return $exit_code
    else
        echo "已取消執行"
    fi
}

# 直接執行版本（支援長指令）
runclip_force() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        clipboard_content=$(pbpaste)
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v xclip &> /dev/null; then
            clipboard_content=$(xclip -selection clipboard -o)
        elif command -v xsel &> /dev/null; then
            clipboard_content=$(xsel --clipboard --output)
        else
            echo "錯誤：請先安裝 xclip 或 xsel"
            return 1
        fi
    else
        echo "錯誤：不支援的作業系統"
        return 1
    fi
    
    if [[ -z "$clipboard_content" ]]; then
        echo "錯誤：剪貼板是空的"
        return 1
    fi
    
    line_count=$(echo "$clipboard_content" | wc -l | tr -d ' ')
    char_count=$(echo -n "$clipboard_content" | wc -c | tr -d ' ')
    
    echo "執行命令 ($line_count 行, $char_count 字元)..."
    
    # 使用臨時檔案執行
    temp_script=$(mktemp /tmp/runshell.XXXXXX)
    echo "$clipboard_content" > "$temp_script"
    chmod +x "$temp_script"
    
    zsh -c "source ~/.zshrc; source $temp_script"
    exit_code=$?
    
    rm -f "$temp_script"
    
    return $exit_code
}

# 只顯示剪貼板內容而不執行
showclip() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        clipboard_content=$(pbpaste)
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v xclip &> /dev/null; then
            clipboard_content=$(xclip -selection clipboard -o)
        elif command -v xsel &> /dev/null; then
            clipboard_content=$(xsel --clipboard --output)
        else
            echo "錯誤：請先安裝 xclip 或 xsel"
            return 1
        fi
    else
        echo "錯誤：不支援的作業系統"
        return 1
    fi
    
    if [[ -z "$clipboard_content" ]]; then
        echo "剪貼板是空的"
        return 1
    fi
    
    line_count=$(echo "$clipboard_content" | wc -l | tr -d ' ')
    char_count=$(echo -n "$clipboard_content" | wc -c | tr -d ' ')
    
    echo "剪貼板內容 ($line_count 行, $char_count 字元)："
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "$clipboard_content"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

saveclip() {
    local filename="${1:-clipboard_script.sh}"

    # WSL 環境 - 使用正確的編碼
    if grep -qi microsoft /proc/version 2>/dev/null; then
        # 設定 PowerShell 輸出編碼為 UTF-8
        clipboard_content=$(powershell.exe -NoProfile -Command "
            [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
            Get-Clipboard -Raw
        " 2>/dev/null | tr -d '\r')
    else
        # 原生 Linux
        if command -v xclip &> /dev/null; then
            clipboard_content=$(xclip -selection clipboard -o 2>/dev/null)
        else
            echo "錯誤：請先安裝 xclip"
            return 1
        fi
    fi

    if [[ -z "$clipboard_content" ]]; then
        echo "錯誤：剪貼板是空的"
        return 1
    fi

    # 使用 printf 保存，確保 UTF-8 編碼
    printf '%s\n' "$clipboard_content" > "$filename"

    # 只對 .sh 檔案加執行權限
    [[ "$filename" == *.sh ]] && chmod +x "$filename"

    # 顯示檔案資訊
    line_count=$(wc -l < "$filename")
    echo "✅ 已將剪貼板內容儲存到: $filename"
    echo "   ($line_count 行)"

    if [[ "$filename" == *.py ]]; then
        echo "   執行方式: python3 $filename"
    elif [[ "$filename" == *.sh ]]; then
        echo "   執行方式: ./$filename"
    fi
}

# ============================================
# Sudo 版本的 saveclip - 可以儲存到需要 root 權限的位置
# ============================================
sudo_saveclip() {
    local filename="${1}"

    # 檢查是否提供檔名
    if [[ -z "$filename" ]]; then
        echo "錯誤：請提供檔案名稱"
        echo "用法: sstf <檔案路徑>"
        echo "範例: sstf /etc/letsencrypt/renewal-hooks/deploy/copy-certs.sh"
        return 1
    fi

    # 取得剪貼板內容
    if grep -qi microsoft /proc/version 2>/dev/null; then
        # WSL 環境
        clipboard_content=$(powershell.exe -NoProfile -Command "
            [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
            Get-Clipboard -Raw
        " 2>/dev/null | tr -d '\r')
    else
        # 原生 Linux
        if command -v xclip &> /dev/null; then
            clipboard_content=$(xclip -selection clipboard -o 2>/dev/null)
        else
            echo "錯誤：請先安裝 xclip"
            return 1
        fi
    fi

    if [[ -z "$clipboard_content" ]]; then
        echo "錯誤：剪貼板是空的"
        return 1
    fi

    # 檢查目標目錄是否需要 sudo
    local target_dir=$(dirname "$filename")
    local needs_sudo=false
    
    # 測試是否可以寫入目標目錄
    if [[ ! -w "$target_dir" ]]; then
        needs_sudo=true
        echo "⚠️  目標位置需要 sudo 權限: $target_dir"
    fi

    # 檢查檔案是否已存在
    if [[ -f "$filename" ]]; then
        echo "⚠️  檔案已存在: $filename"
        
        # 如果需要 sudo，先顯示現有檔案資訊
        if $needs_sudo; then
            echo "現有檔案資訊:"
            sudo ls -lh "$filename"
        else
            ls -lh "$filename"
        fi
        
        echo -n "是否覆蓋? (y/N) "
        read -r response
        
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            echo "已取消"
            return 0
        fi
        
        # 備份現有檔案
        local backup_name="${filename}.backup.$(date +%Y%m%d_%H%M%S)"
        if $needs_sudo; then
            sudo cp "$filename" "$backup_name"
            echo "✓ 已備份到: $backup_name"
        else
            cp "$filename" "$backup_name"
            echo "✓ 已備份到: $backup_name"
        fi
    fi

    # 建立臨時檔案
    local temp_file=$(mktemp /tmp/sstf.XXXXXX)
    printf '%s\n' "$clipboard_content" > "$temp_file"

    # 顯示將要儲存的內容資訊
    local line_count=$(wc -l < "$temp_file")
    local size=$(wc -c < "$temp_file")
    
    echo ""
    echo "準備儲存:"
    echo "  目標: $filename"
    echo "  大小: $line_count 行, $size 位元組"
    
    # 顯示前幾行預覽
    echo ""
    echo "內容預覽 (前 5 行):"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    head -n 5 "$temp_file"
    if [[ $line_count -gt 5 ]]; then
        echo "... (還有 $((line_count - 5)) 行)"
    fi
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # 確認儲存
    echo -n "確定要儲存嗎? (y/N) "
    read -r confirm
    
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
        rm -f "$temp_file"
        echo "已取消"
        return 0
    fi

    # 儲存檔案
    if $needs_sudo; then
        sudo cp "$temp_file" "$filename"
        
        # 設定權限
        if [[ "$filename" == *.sh ]]; then
            sudo chmod +x "$filename"
            echo "  ✓ 已設定執行權限"
        fi
    else
        cp "$temp_file" "$filename"
        
        # 設定權限
        if [[ "$filename" == *.sh ]]; then
            chmod +x "$filename"
            echo "  ✓ 已設定執行權限"
        fi
    fi

    # 清理臨時檔案
    rm -f "$temp_file"

    # 顯示結果
    echo ""
    echo "✅ 已將剪貼板內容儲存到: $filename"
    echo "   ($line_count 行)"
    
    # 顯示檔案資訊
    if $needs_sudo; then
        sudo ls -lh "$filename"
    else
        ls -lh "$filename"
    fi

    # 根據檔案類型提供執行建議
    if [[ "$filename" == *.py ]]; then
        echo "   執行方式: python3 $filename"
    elif [[ "$filename" == *.sh ]]; then
        if $needs_sudo; then
            echo "   執行方式: sudo $filename"
        else
            echo "   執行方式: ./$filename"
        fi
    fi
}

# 設定別名
alias sstf='sudo_saveclip'  # sudo save to file

# 複製檔案或管道內容到剪貼板
copytoclip() {
    # 檢查 xclip 是否安裝
    if ! command -v xclip &> /dev/null; then
        echo "錯誤：xclip 未安裝。請先安裝 xclip"
        return 1
    fi

    # 如果沒有參數且有管道輸入
    if [[ $# -eq 0 ]]; then
        if [[ -p /dev/stdin ]]; then
            # 從管道讀取
            xclip -selection clipboard
            echo "✓ 已將管道內容複製到剪貼板"
        else
            echo "用法："
            echo "  copytoclip <檔案名>    # 複製檔案內容"
            echo "  <指令> | copytoclip    # 複製指令輸出"
            return 1
        fi
    else
        # 處理檔案
        local file="$1"

        if [[ ! -f "$file" ]]; then
            echo "錯誤：檔案 '$file' 不存在"
            return 1
        fi

        # 複製檔案內容到剪貼板
        xclip -selection clipboard < "$file"

        # 顯示成功訊息和檔案資訊
        local size=$(wc -c < "$file" | tr -d ' ')
        local lines=$(wc -l < "$file" | tr -d ' ')
        echo "✓ 已複製 '$file' 到剪貼板 (${lines} 行, ${size} 位元組)"
    fi
}

# ============================================
# Sudo 版本 - 可以讀取需要 root 權限的檔案
# ============================================
sudo_copytoclip() {
    if [[ $# -eq 0 ]]; then
        echo "用法："
        echo "  sudo_copytoclip <檔案名>    # 複製需要 root 權限的檔案"
        return 1
    fi

    local file="$1"

    if [[ ! -f "$file" ]]; then
        echo "錯誤：檔案 '$file' 不存在"
        return 1
    fi

    # 檢查是否需要 sudo（如果可以直接讀取就不用 sudo）
    if [[ -r "$file" ]]; then
        # 檔案可讀，直接複製
        xclip -selection clipboard < "$file"
    else
        # 需要 sudo
        sudo cat "$file" | xclip -selection clipboard
    fi

    # 顯示成功訊息
    local size=$(sudo wc -c < "$file" 2>/dev/null | tr -d ' ')
    local lines=$(sudo wc -l < "$file" 2>/dev/null | tr -d ' ')
    echo "✓ 已複製 '$file' 到剪貼板 (${lines} 行, ${size} 位元組)"
}

# 設定別名
alias sctc='sudo_copytoclip'  # sudo copy to clipboard

# 設定別名（可選）
alias ctc='copytoclip'
alias clip='copytoclip'
alias stf='saveclip'
unsetopt BEEP

export AWS_ACCESS_KEY_ID="ASIA2OY732VRSNZMLAV6"
export AWS_SECRET_ACCESS_KEY="VzQLyYHJvM5nI77Nwl/29jipKRLfmjL05tRLOo+9"
export AWS_SESSION_TOKEN="IQoJb3JpZ2luX2VjEHIaCXVzLWVhc3QtMSJIMEYCIQDosGuQIHn1wI+q3T5YnBTWnvgnXGr5gBAHX7OvT7CoTAIhANa9amG6qYckKtK0lnm6IvUnaIouxY3GLFyiI6NStVF+KpQDCJv//////////wEQABoMNzE4OTM2OTg2OTc5IgxGnw7a5RxmQ3QBrCAq6AJPmyoZ0I6XFznwsanxB/prwnrb//w1MskIzssPRKNrrw6XACOqPBVAklDsjPgfbHNjSuMNvyvXio/CnU+QRUcwn0/5rpDzd2b1vImmnuKsoGy/2+++QWwdV3F+83kWhmeVdzCvODR4+Gg+awVrI7mnZwIVpTqFUzSsQv2/lb3yfIY52U3Sa0jYSraDq/dVdr0AWehYByebRkjDhYDNJ/Xo2o28WlGoCKFWe2qd6T6xrSOSr7xkQacu235UwEkYVoPSaL2kszE1TlSuLosefjIcTWlQkdJ88mN1sM+TG9dD29/6CzwmEYaoqert0H97yQDhjEsZSPrfh5CnMKt27XBS7PEaLjLKbKIzOguQXvYAW8GOGytnkfqQ32xy2GdhQlUVb/lsl0akkOJWIJ+Gfi7CSFdMBojBBgl8aazAyt+x/BpA0PvnG6miF9hqRwXosjinSE1BscODjVFlB4Wtdkd9iAmISxYqYc0w7NGgxAY6pQES0oiViwZs+hWxxswxgJe5jP1VTm9QHVVZf/tNpiaZ6UFlLcmBdtjYdF2cBWeAMxt7MBqAYudXr1vDSezFqt+l6RwoXhgLrmBYDBRVuYPHDyqyLQlwfJnhppzKiafDaLqxOqx5ZIs/vC/sSkxbKB117B2tPi5K2XxRsB+LSDw7cS06B3fJaWgqp8j9UcdzTbXJleGElndwn6r7qfWsWHit6vqCAZU="
if [ -z "$DISPLAY" ]; then export DISPLAY=allenl-2404:11.0; fi

alias mycontainer='xhost +local:docker 2>/dev/null && docker start my_persistent_container 2>/dev/null && docker exec -it -e DISPLAY=$DISPLAY my_persistent_container zsh'

alias safe_reboot='sudo /home/allenl/safe_reboot.sh'


# 修正 MobaXterm 的方向鍵問題
if [[ "$TERM" == "xterm" ]]; then
    export TERM=xterm-256color
fi
export PATH="/opt/mount/cov-analysis-linux64-2025.3.0/bin:$PATH"

# 在檔案末尾加入這行,讓sudo ctc可以work
alias sudo='sudo '  # 注意：等號後面有個空格，這很重要！









# ============ X Server 自動偵測設定 ============

# 手動偵測 X Server 的函數
detect_xserver() {
    local WINDOWS_IP="192.168.31.6"
    if [[ -n "$SSH_CLIENT" ]]; then
        WINDOWS_IP=$(echo $SSH_CLIENT | awk '{print $1}')
    fi

    echo "正在偵測 X Server..."
    for display_num in {0..5}; do
        if timeout 0.1 bash -c "echo > /dev/tcp/$WINDOWS_IP/600$display_num" 2>/dev/null; then
            export DISPLAY="$WINDOWS_IP:$display_num.0"
            echo "✓ DISPLAY 設定為 $DISPLAY"
            return 0
        fi
    done

    echo "✗ 找不到 X Server"
    return 1
}

# X Server 工具函數
xserver_info() {
    if [[ -n "$DISPLAY" ]]; then
        echo "當前 DISPLAY: $DISPLAY"
        if xset q &>/dev/null; then
            echo "✓ X Server 連線正常"
        else
            echo "✗ X Server 無法連線"
        fi
    else
        echo "DISPLAY 未設定"
    fi
}

# 別名
alias xi='xserver_info'
alias dx='detect_xserver'

# 自動偵測並設定 X Server (只在 SSH 連線時執行)
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
    # 如果 DISPLAY 已被設定但指向 localhost (SSH forwarding)，取消它
    if [[ -n "$DISPLAY" && "$DISPLAY" =~ ^localhost: ]]; then
        unset DISPLAY
    fi
    if [[ -n "$DISPLAY" && "$DISPLAY" =~ ^[a-zA-Z0-9-]+:[0-9]+ ]]; then
        # DISPLAY 被設定為主機名:port 格式 (SSH forwarding)，取消它
        unset DISPLAY
    fi

    # 執行自動偵測
    if [[ -z "$DISPLAY" ]]; then
        detect_xserver
    fi
fi




alias python=python3
alias pip=pip3

# ============ Tmux 自動連線設定 ============

# SSH 連線時自動進入 tmux（同 session，最多 MAX_WINDOWS 個 window）
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]] && [[ -z "$TMUX" ]]; then
    SESSION="session0"
    MAX_WINDOWS=7
    LOCK_DIR="/tmp/tmux_${SESSION}.lock"
    MARKER_DIR="/tmp/tmux_${SESSION}_markers"

    # 原子鎖
    while ! mkdir "$LOCK_DIR" 2>/dev/null; do sleep 0.1; done

    mkdir -p "$MARKER_DIR"
    MY_MARKER="$MARKER_DIR/$$"

    # 建立 session（如果不存在）
    tmux has-session -t $SESSION 2>/dev/null || tmux new-session -d -s $SESSION

    # 取得現有 windows
    existing_windows=($(tmux list-windows -t $SESSION -F "#{window_index}" 2>/dev/null))

    # 取得已 attach 的 clients: PID -> window 映射
    typeset -A attached_pids
    while IFS=: read -r pid win; do
        attached_pids[$pid]=$win
    done < <(tmux list-clients -F '#{client_pid}:#{window_index}' 2>/dev/null)

    # 取得真正 attached 的 windows
    attached_windows=(${(v)attached_pids})

    # 清理 stale markers + 收集真正 pending 的 windows
    # Marker 只在「選擇但還沒 attach」的短暫期間有效
    pending_windows=()
    for marker in "$MARKER_DIR"/*(.N); do
        pid=${marker:t}
        if kill -0 "$pid" 2>/dev/null; then
            # 進程還活著
            if [[ -n "${attached_pids[$pid]}" ]]; then
                # 已經 attach 了，marker 是 stale，刪除
                rm -f "$marker"
            else
                # 還沒 attach，是真正 pending
                pending_windows+=("$(cat "$marker")")
            fi
        else
            # 進程死了
            rm -f "$marker"
        fi
    done

    # 合併：真正 attached + 真正 pending
    occupied=($attached_windows $pending_windows)

    # 策略：優先創建新 window，達到上限後才複用
    target_window=""

    if (( ${#existing_windows[@]} < MAX_WINDOWS )); then
        # 還沒達到上限，創建新 window
        tmux new-window -t "$SESSION"
        target_window=$(tmux list-windows -t $SESSION -F "#{window_index}" | tail -1)
    else
        # 達到上限，找連線數最少的 window（平均分配）
        local min_count=999 min_win=""
        for win in $existing_windows; do
            local count=0
            for occ in $occupied; do [[ "$occ" == "$win" ]] && ((count++)); done
            (( count < min_count )) && { min_count=$count; min_win=$win; }
        done
        target_window=$min_win
    fi

    # 創建標記（只在 attach 前短暫存在）
    echo $target_window > "$MY_MARKER"

    # 釋放鎖
    rmdir "$LOCK_DIR" 2>/dev/null

    # attach（linked session，斷線自動清理）
    # 注意：exec 後 marker 會在下次連線時被清理（因為 PID 已在 attached_pids 中）
    exec tmux new-session -t $SESSION \; set-option destroy-unattached on \; select-window -t ":${target_window}"
fi
# Tmux 查詢 alias
alias tmc='tmux list-clients -t session0'
alias tmcn='tmux list-clients -t session0 | wc -l'

# ============ Tmux Window Name 控制 ============
# TAB_NAME_MODE: "claude" (預設，Claude 優先) 或 "folder" (永遠顯示目錄)
TAB_NAME_MODE="${TAB_NAME_MODE:-claude}"

# 切換 tab 名稱模式的函數
tab_mode() {
    case "$1" in
        claude|c)
            export TAB_NAME_MODE="claude"
            echo "Tab 模式: Claude 優先 (有 claude 進程時讓 claude 控制名稱)"
            ;;
        folder|f|dir|d)
            export TAB_NAME_MODE="folder"
            echo "Tab 模式: 永遠顯示目錄名稱"
            ;;
        ""|status)
            echo "當前 Tab 模式: $TAB_NAME_MODE"
            echo "可用模式: claude (c), folder (f)"
            ;;
        *)
            echo "用法: tab_mode [claude|folder|status]"
            echo "  claude (c): Claude 優先模式"
            echo "  folder (f): 永遠顯示目錄"
            ;;
    esac
}

precmd() {
    if [[ -n "$TMUX" ]]; then
        if [[ "$TAB_NAME_MODE" == "folder" ]]; then
            # folder 模式：永遠顯示目錄名
            printf '\033]0;%s\007' "${PWD##*/}"
        else
            # claude 模式（預設）：檢查 claude 進程
            local pane_pid=$(tmux display-message -p '#{pane_pid}' 2>/dev/null)
            local has_claude=false

            if [[ -n "$pane_pid" ]] && pgrep -P "$pane_pid" -f "claude" >/dev/null 2>&1; then
                has_claude=true
            fi

            if [[ "$has_claude" == "false" ]]; then
                # Claude 沒在運行，設定為目錄名
                printf '\033]0;%s\007' "${PWD##*/}"
            fi
        fi
    else
        printf '\033]0;%s\007' "${PWD##*/}"
    fi
}
