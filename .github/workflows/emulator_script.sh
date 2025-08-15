#!/usr/bin/bash

# Print emulator environment
uname -a
#env
echo "adb: pid=$(pidof adb)"
#ifconfig -a 2>1

# Core
ADB_TAGS="MainActivity:AppCompatActivity"

# Debugging
#ADB_TAGS="$ADB_TAGS "ExampleInstrumentedTest"

adb logcat -c
echo ""
echo "##### ADB logcat started ######"
adb logcat $ADB_TAGS -v color &
echo ""

adb wait-for-device   # expected emulator boot time: 393378ms

sleep 5.0    
       
until adb shell getprop sys.boot_completed | grep -q 1; do echo "Waiting for emulator to boot..."; sleep 5; done &1>/dev/null

sleep 1.0

#./gradlew connectedCheck --stacktrace --java-home="$JAVA_HOME"
#./gradlew app:runAndroidTests

