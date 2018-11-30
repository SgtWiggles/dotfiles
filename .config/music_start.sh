#! /bin/bash
if pgrep -x "ncmpcpp" > /dev/null; then
	echo ""
else
	ume --name="music" -x ncmpcpp
fi

