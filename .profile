export PATH=/home/alanxw/.local/bin:$PATH

export GOPATH=$HOME/.go
export CARGOPATH=$HOME/.cargo/bin
export MPLCONFIGDIR=/tmp/
export GTK_THEME=Adwaita:dark

# Set default editors for sudoedit
export EDITOR=nvim;
export VISUAL=nvim;
export NOTES=$HOME/notes

if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
	exec sway
fi

rfkill unblock all
