#!/bin/bash

chmod +x blurlock.sh

if ls /usr/bin | grep -i sudo
then 
	doas mv blurlock.sh /usr/bin/blurlock
else
	sudo mv blurlock.sh /usr/bin/blurlock.sh
fi
echo
echo done
echo
