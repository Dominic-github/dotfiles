#!/bin/sh

EXIT_RESULT="󰈆  Exit i3  "
SLEEP_RESULT="󰤄  Sleep  "
HIBERNATE_RESULT="󰪓  Hibernate  "
SHUTDOWN_RESULT="󰤆  Shutdown  "
REBOOT_RESULT="󰝳  Reboot  "


DIALOG_RESULT=$(echo -e "$EXIT_RESULT\n$SLEEP_RESULT\n$HIBERNATE_RESULT\n$SHUTDOWN_RESULT\n$REBOOT_RESULT" | rofi -dmenu)

echo "This result is : $DIALOG_RESULT"
sleep 1;

if [ "$DIALOG_RESULT" = "$EXIT_RESULT" ];
then
    i3-msg 'exit'
elif [ "$DIALOG_RESULT" = "$SLEEP_RESULT" ];
then
    exec systemctl hybrid-sleep 
elif [ "$DIALOG_RESULT" = "$HIBERNATE_RESULT" ];
then
    exec systemctl hibernate 
elif [ "$DIALOG_RESULT" = "$SHUTDOWN_RESULT" ];
then
    exec shutdown -h now
elif [ "$DIALOG_RESULT" = "$REBOOT_RESULT" ];
then
    exec reboot
fi

