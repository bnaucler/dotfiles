# bnaucler's .login script
#
# To make you feel a little more welcome?
# For csh / tcsh

clear

if (-x /usr/local/bin/ansiweather) then
	/usr/local/bin/ansiweather -a false -l $LOCATION
endif

if (-x /usr/local/bin/figlet) then
	/usr/local/bin/figlet hello $LOGNAME
endif
