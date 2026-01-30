# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey '5~' kill-word

# PRELOAD
# LD_PRELOAD=/usr/lib64/libomp.so /usr/bin/tesseract "$@"

export OLLAMA_MODELS=/mymedia/ollama-models
export HF_HOME=/mymedia/huggingface-models
# Ferramentas de compilação com Clang/LLVM
# # export CC=clang
# export CXX=clang++
# export AR=llvm-ar
# export NM=llvm-nm
# export RANLIB=llvm-ranlib

export GPG_TTY=$(tty)
export MESA_LOADER_DRIVER_OVERRIDE=radeonsi
export AMD_VULKAN_ICD=RADV
export AMD_VULKAN_ASYNC_COMPUTE=1
# Pipewire set-input
export INPUTAUDIO=$(wpctl status | grep -m 1 -a -B 10 'Source endpoints:' |\
    grep -m 1 -a -A 10 'Sources:' | grep '[1-9]' | sed 's/.*\(...[0-9]\+\)\.\s.*/\1/')

# PATH to executables
export PATH=$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh/custom/
export XDG_CONFIG_HOME=~/.config
export LOCAL=~/.local
export MYVIMRC=~/.dotfiles/nvim/init.lua
export AB=~/.dotfiles/nvim/lua/imcylon/abrev.lua
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgrep.conf
export MOZ_ENABLE_WAYLAND=1

# flutter config - after run sdkmanager^flutter --licenses
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH
export CHROME_EXECUTABLE=/bin/google-chrome-stable

HISTSIZE=SAVEHIST=100000

# Setting keymap/keyboard
# setxkbmap -option caps:escape_shifted_capslock
# setxkbmap -layout br

# Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

export UPDATE_ZSH_DAYS=1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"
#

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
plugins=(
    # auto-fortune-cowsay
    # chucknorris
    # command-not-found
    # taskwarrior
    # tmuxinator
    alias-finder
    aliases
    archlinux
    asdf
    bgnotify
    colored-man-pages
    common-aliases
    compleat
    copyfile
    extract
    fancy-ctrl-z
    fzf
    git
    git-auto-fetch
    git-prompt
    gitfast
    globalias
    history-substring-search
    rust
    sprunge
    ssh-agent
    tmux
    vi-mode
    web-search
    zsh-autosuggestions
    # zsh-codex
    zsh-navigation-tools
)
# unset ZSH_AUTOSUGGEST_USE_ASYNC
# OMZ CODEX - AI
bindkey '^X' create_completion
source "$ZSH_CUSTOM/plugins/zsh_codex/zsh_codex.plugin.zsh"

ZSH_WEB_SEARCH_ENGINES=(
    enpt "https://translate.google.com.br/?hl=pt-BR#view=home&op=translate&sl=en&tl=pt&text="
    pten "https://translate.google.com.br/?hl=pt-BR#view=home&op=translate&sl=pt&tl=en&text="
    reddit "https://www.reddit.com/search/?q="
    yt "https://www.youtube.com/results?search_query="
    gitlab "https://gitlab.com/search?utf8=%E2%9C%93&snippets=&scope=projects&repository_ref=&search="
    github "https://github.com/search?q=&type="
    ggl "https://google.com/search?q="
)
# alias finder conf
ZSH_ALIAS_FINDER_AUTOMATIC=true
# vi-mode conf
VI_MODE_SET_CURSOR=true
# tmux conf
# # CONFIGURATION VARIABLES
# Automatically start tmux
: ${ZSH_TMUX_AUTOSTART:=true}
# Only autostart once. If set to false, tmux will attempt to
# autostart every time your zsh configs are reloaded.
: ${ZSH_TMUX_AUTOSTART_ONCE:=true}
# Automatically connect to a previous session if it exists
: ${ZSH_TMUX_AUTOCONNECT:=false}
# Automatically close the terminal when tmux exits
# ZSH_TMUX_AUTOSTART=false
# ZSH_TMUX_AUTOSTART_ONCE=true
# ZSH_TMUX_AUTOCONNECT=true
# ZSH_TMUX_UNICODE=true
: ${ZSH_TMUX_CONFIG:=~/.tmux.conf}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias luamake=/home/imcylon/.local/share/nvim/site/pack/lua-language-server/3rd/luamake/luamake
. $ZSH/oh-my-zsh.sh
. $HOME/.dotfiles/misc/aliases
. $HOME/.dotfiles/misc/zsh-functions
# source ~/.bash_profile
### Zoxide ###
# . /home/imcylon/.dotfiles/misc/bin/XAUTH.sh

neofetch
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. $HOME/.asdf/asdf.sh
echo ''
echo '------------------'
echo '------------------------------------'
ls $HOME
echo '------------------------------------'
echo '------------------'
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

bgnotify_bell=false ## disable terminal bell
bgnotify_threshold=60 ## set your own notification threshold


# eval "$(starship init zsh)"
# export STARSHIP_CONFIG=~/.config/starship.toml
#ZSH_THEME="spaceship"
#export SPACESHIP_CONFIG="$HOME/.dotfiles/misc/spaceship.zsh"
#export SPACESHIP_CONFIG="$HOME/.zsh/spaceship/spaceship.zsh"
#source $HOME/.zsh/spaceship/spaceship.zsh
#source $HOME/.dotfiles/misc/spaceship.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/etc/profile.d/conda.sh" ]; then
#         . "/usr/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.


# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
if [[ -f ~/.dotfiles/zsh/zsh_ignore.sh ]]; then
  source ~/.dotfiles/zsh/zsh_ignore.sh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/zsh/site-functions/zsh-syntax-highlighting.zsh
