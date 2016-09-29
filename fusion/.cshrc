# $Fre2BSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
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
alias apan	ssh -t apansson.se tmux a -d
alias mnthome	sudo mount_smbfs -I router.asus.com //guest@router.asus.com/Shared /Volumes/SHARED
alias weather	ansiweather -a false -l 
alias gweather	curl wttr.in/

# UMask
umask 006

# Prompt
set prompt="<%n@%m %b%/> "

set nobeep

set path = (~/bin /sbin /bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /usr/games /usr/X11R6/bin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	more
setenv	BLOCKSIZE	K
setenv	LC_ALL en_us.utf-8
setenv	ANDROID_HOME /usr/local/opt/android-sdk

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
