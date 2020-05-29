#!/bin/bash

# gets battery level
Keyboard1=`ioreg -c AppleBluetoothHIDKeyboard |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`
Keyboard2=`ioreg -c IOAppleBluetoothHIDDriver |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`

Mouse1=`ioreg -c BNBMouseDevice |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`
Mouse2=`ioreg -c AppleHSBluetoothDevice |grep '"BatteryPercent" =' | cut -d= -f2 | cut -d ' ' -f 2`


#battery level variable
power_level=10

if [ "$Keyboard1" -lt "$power_level" ]; then
	osascript -e "display notification \"Keyboard battery is at ${Keyboard1}%.\" with title \"Keyboard Battery Low\""
fi

if [ "$Keyboard2" -lt "$power_level" ]; then
	osascript -e "display notification \"Keyboard battery is at ${Keyboard2}%.\" with title \"Keyboard Battery Low\""
fi

if [ "$Mouse1" -lt "$power_level" ]; then
	osascript -e "display notification \"Mouse battery is at ${Mouse1}%.\" with title \"Mouse Battery Low\""
fi

if [ "$Mouse2" -lt "$power_level" ]; then
	osascript -e "display notification \"Mouse battery is at ${Mouse2}%.\" with title \"Mouse Battery Low\""
fi
