# $FreeBSD: head/share/skel/dot.login 278616 2015-02-12 05:35:00Z cperciva $
#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# see also csh(1), environ(7).
#

clear

if (-x /usr/local/bin/ansiweather) then
	/usr/local/bin/ansiweather -a false -l $LOCATION
endif

if (-x /usr/local/bin/figlet) then
	/usr/local/bin/figlet -f $HOME/.figlet/chunky.flf hello
endif
