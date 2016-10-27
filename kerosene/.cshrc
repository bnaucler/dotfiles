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
alias cal			gcal --starting-day=1
alias apan			ssh apansson.se
alias halt			sudo shutdown -p now
alias bright		sudo sysctl hw.acpi.video.lcd0.brightness=100
alias medi			sudo sysctl hw.acpi.video.lcd0.brightness=60
alias dim			sudo sysctl hw.acpi.video.lcd0.brightness=20
alias mnthome		sudo mount_smbfs -I router.asus.com //guest@router.asus.com/Shared /mnt/home/
alias mntusb		sudo mount -t msdosfs /dev/da0s1 /mnt/usb
alias umntusb		sudo umount /mnt/usb
alias tpoff			sysctl hw.psm.synaptics.touchpad_off=1
alias tpon			sysctl hw.psm.synaptics.touchpad_off=0
alias weather		ansiweather -a false -l 
alias gweather		curl wttr.in/
alias fbreader		FBReader

# Color definitions
set     RED="%{\033[0;31m%}"
set   GREEN="%{\033[0;32m%}"
set  YELLOW="%{\033[0;33m%}"
set    BLUE="%{\033[0;34m%}"
set MAGENTA="%{\033[0;35m%}"
set    CYAN="%{\033[0;36m%}"
set   WHITE="%{\033[0;37m%}"
set   RESET="%{\033[0m%}"

# UMask
umask 006

# Prompt
set prompt="<%n@${GREEN}%m${RESET} %b%/> "

# BE QUIET!
set nobeep

set path = (~/bin /sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/Dropbox/go/bin $HOME/bin)

setenv	EDITOR			vim
setenv	PAGER			less
setenv	BLOCKSIZE		K
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
