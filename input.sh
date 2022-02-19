#!/bin/bash

mydir=/home/karttikeya/blurlock
echo What installation type would you prefer?
echo '1) system-wide'
echo '2) user-only'
echo
read var1

chmod +x blurlock.sh


if [ $var1='1' ] ; then
	if test -e /usr/bin/doas ; then
		doas cp blurlock.sh /usr/bin/blurlock
	elif test -e /usr/bin/sudo ; then 
		sudo cp blurlock.sh /usr/bin/blurlock
	else 
		echo Run as root
	fi
elif [ $var1='2' ] ; then
	if [ find ~/ -name .profile ] ; then 									# NEED TO FIGURE OUT WHICH SHELL IS BEING USED AND FOR FISH
		if [ grep -i .local/bin ~/.profile ] ; then 						# SIMPLE IF ELSE || NOT WORKING
			cp blurlock.sh ~/.local/bin/blurlock 							# COULD TRY WITH INDIVIDUAL, BUT $SHELL ALWAYS OUTPUTS TRUE
			echo
			echo done
			echo
		else 
			echo 'if [ -d "$HOME/.local/bin" ] ; then' >> ~/.local/bin 		# COULD CHECK FOR FISH IN INSTALLED PACKAGES OR FOR CONFIG AND THEN ADD PATH VARIABLE IF CONFIG EXISTS
			echo ' 	 PATH="HOME/.local/bin:$PATH"' >> ~/.local/bin 			# OR ADD A CONFIG FILE ANYWAY 
			echo 'fi' >> ~/.local/bin 										# HAVE TO CHECK FOR OMF TOO CZ HAS DIFF CONFIG LOCATION
		fi
	else
		touch ~/.profile
		echo 'if [ -d "$HOME/.local/bin" ] ; then' >> ~/.local/bin
		echo ' 	 PATH="HOME/.local/bin:$PATH"' >> ~/.local/bin
		echo 'fi' >> ~/.local/bin
	fi
else 
	echo Input valid number
fi

