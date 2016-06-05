#!/bin/sh
#copyright 2016 - amin.khozaei@gmail.com
#License is GPLv3
#This code release without any kind of WARRANTIES.
BACKLIGHT_DIR=/sys/class/backlight
ACPI_DIR=${BACKLIGHT_DIR}/acpi_video0
INTEL_DIR=${BACKLIGHT_DIR}/intel_backlight

read ACPI_MAX < "$ACPI_DIR/max_brightness"
read INTEL_MAX < "$INTEL_DIR/max_brightness"

#echo "acpimax= $ACPI_MAX"
#echo "intelmax= $INTEL_MAX"

read ACPI_CURRENT < "$ACPI_DIR/brightness"
ACPI_PERCENT=$(awk "BEGIN { PERCENT=100*${ACPI_CURRENT}/${ACPI_MAX}; i=int(PERCENT); print (PERCENT-i<0.5)?i:i+1 }")
#echo "acpi_percent = $ACPI_PERCENT"
ACPI_PERCENT=$(awk "BEGIN { j=int(${ACPI_PERCENT}); print (j<10)?5:j }")

#echo "acpi_percent = $ACPI_PERCENT"

INTEL_NEW_VALUE=$(awk "BEGIN { VALUE=${ACPI_PERCENT}*${INTEL_MAX}/100; i=int(VALUE); print (VALUE-i<0.5)?i:i+1 }")

#echo "intel_value = $INTEL_NEW_VALUE"

echo "$INTEL_NEW_VALUE" > /sys/class/backlight/intel_backlight/brightness
