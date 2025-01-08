# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export WINEPREFIX='/home/alanxw/.wine-games'
# fzf
source <(fzf --zsh)

# Basic command aliases
alias ls='eza -h --group-directories-first --color=always'
alias cat='bat'
alias grep='grep --color=auto'
alias mv='mv -i'
alias cp='cp -i'
alias tp='trash-put'
alias lsblk='lsblk -o name,label,uuid,fstype,size'
alias rm='echo'
alias nms='nms -ac'
alias upload='curl -F file=@- 0x0.st | wl-copy'
alias netstat='sudo netstat -tupan'


# Editing
bindkey -v
bindkey "^ " autosuggest-accept
setopt extended_glob

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
myunzip () 
{ 
    unzip "$1" -d "${1%.zip}"
}

# Micromamba
alias mm="micromamba"

# Application aliases
alias zth='zathura --fork'
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
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias mm="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<


PATH="/home/alanxw/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/alanxw/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/alanxw/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/alanxw/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/alanxw/perl5"; export PERL_MM_OPT;
