#!/bin/bash

# gets battery level
Keyboard=`ioreg -c AppleBluetoothHIDKeyboard |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`

Mouse=`ioreg -c BNBMouseDevice |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`


#battery level variable
power_level=10

if [ "$Keyboard" -lt "$power_level" ]; then
	osascript -e "display notification \"Keyboard battery is at ${Keyboard}%.\" with title \"Keyboard Battery Low\""
fi



if [ "$Mouse" -lt "$power_level" ]; then
	osascript -e "display notification \"Mouse battery is at ${Mouse}%.\" with title \"Mouse Battery Low\""
fi
