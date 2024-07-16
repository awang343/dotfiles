# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/home/alanxw/.local/bin:/home/alanxw/.go/bin:/home/alanxw/.spicetify:$PATH

# fzf
source <(fzf --zsh)


# Basic command aliases
alias ls='eza -h --group-directories-first --color=always'
alias cat='bat'
alias grep='grep --color=auto'
alias mv='mv -i'
alias tp='trash-put'
alias lsblk='lsblk -o name,label,uuid,fstype,size'
alias rm='echo'
alias pkglist='comm -23 <(pacman -Qqt | sort) <(pacman -Qqg base | sort)'
alias nms='nms -ac'
alias up-pipe='curl -F file=@- 0x0.st | wl-copy'
alias wine='DISPLAY= wine'
alias wine64='DISPLAY= wine64'
alias ytfzf='ytfzf -T wayland -t'

# Editing
bindkey -v
bindkey "^ " autosuggest-accept

alias vim='nvim'
alias svim='sudoedit'

# QoL Functions
conf() {
  nvim ~/.config/$1
}
gitauth() {
    pkill ssh-agent; 
    eval `ssh-agent`; 
    ssh-add ${1-~/.ssh/gh_ed25519};
}

# Micromamba
alias mminstall='micromamba install -c conda-forge'
alias mm='micromamba'
alias conda='micromamba' 

# Application aliases
alias code='code --enable-proposed-api ms-toolsai.jupyter'
alias matlab='/usr/share/matlab/bin/matlab 2>&1 /dev/null & disown'
alias zth='exec zathura --fork'
alias mpv='mpv --no-audio-display'
alias feh='feh -T default'
alias ping='gping'

source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -s /home/alanxw/.autojump/etc/profile.d/autojump.sh ]] && source /home/alanxw/.autojump/etc/profile.d/autojump.sh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/alanxw/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/alanxw/.micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

