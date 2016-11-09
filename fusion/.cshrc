# bnaucler's .cshrc
#
# based on FreeBSD 12 skelfiles

# Alias
alias h				history 25
alias j				jobs -l
alias la			ls -a
alias lf			ls -FA
alias ll			ls -lA
alias vi			vim
alias whereis		which
alias cal			gcal --starting-day=1
alias apan			ssh -t apansson.se tmux a -d
alias mnthome		sudo mount_smbfs //guest@router.asus.com/Shared /Volumes/SHARED
alias weather		ansiweather -a false -l
alias gweather		curl wttr.in/
alias mutt			$HOME/bin/muttwr.sh

# Color definitions
set     RED="%{\033[0;31m%}"
set   GREEN="%{\033[0;32m%}"
set  YELLOW="%{\033[0;33m%}"
set    BLUE="%{\033[0;34m%}"
set MAGENTA="%{\033[0;35m%}"
set    CYAN="%{\033[0;36m%}"
set   WHITE="%{\033[1;37m%}"
set   RESET="%{\033[0m%}"

# UMask
umask 006

# Prompt
set prompt="<%n@${WHITE}%m${RESET} %b%/> "

# BE QUIET!
set nobeep

set PATH = (~/bin /sbin /bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /usr/games /usr/X11R6/bin $HOME/bin $HOME/Dropbox/go/bin /usr/local/texbin)

setenv	EDITOR			vim
setenv	PAGER			less
setenv	TERM			screen-256color
setenv	BLOCKSIZE		K
setenv	LC_ALL			en_us.utf-8
setenv	ANDROID_HOME	/usr/local/opt/android-sdk
setenv  GOPATH			$HOME/Dropbox/go
setenv	LOCATION		amsterdam

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 100
	set savehist = 100
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif
