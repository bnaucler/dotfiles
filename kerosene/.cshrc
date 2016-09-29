# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
alias j		jobs -l
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias vi	vim
alias cal	gcal --starting-day=1
alias apan	ssh apansson.se
alias halt	sudo shutdown -p now
alias bright	sudo sysctl hw.acpi.video.lcd0.brightness=100
alias medi	sudo sysctl hw.acpi.video.lcd0.brightness=60
alias dim	sudo sysctl hw.acpi.video.lcd0.brightness=20
alias mnthome	sudo mount_smbfs -I router.asus.com //guest@router.asus.com/Shared /mnt/home/
alias mntusb	sudo mount -t msdosfs /dev/da0s1 /mnt/usb
alias umntusb	sudo umount /mnt/usb
alias tpoff 	sysctl hw.psm.synaptics.touchpad_off=1
alias tpon	sysctl hw.psm.synaptics.touchpad_off=0
alias weather	ansiweather -a false -l 
alias gweather	curl wttr.in/
alias fbreader	FBReader

# UMask
umask 006

# Prompt
set prompt="<%n@%m %b%/> "

set nobeep

set path = (~/bin /sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	more
setenv	BLOCKSIZE	K

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
