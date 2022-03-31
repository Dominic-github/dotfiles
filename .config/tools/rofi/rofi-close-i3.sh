#!/bin/sh

DIALOG_RESULT=$(echo -e 'Exit i3\nSleep\nHibernate\nShutdown\nReboot' | rofi -dmenu -i -p )

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "Exit i3" ];
then
    i3-msg 'exit'
elif [ "$DIALOG_RESULT" = "Sleep" ];
then
    exec systemctl hybrid-sleep 
elif [ "$DIALOG_RESULT" = "Hibernate" ];
then
    exec systemctl hibernate 
elif [ "$DIALOG_RESULT" = "Shutdown" ];
then
    exec shutdown -h now
elif [ "$DIALOG_RESULT" = "Reboot" ];
then
    exec reboot
fi

