#!/bin/bash

# This script uses the /data/base.svg file as a base that is modified its result and exported as a PNG file.
# The resulting PNG files are saved in the /data/ directory.

# The thing we modify is the stdDeviation attribute on a feGaussianBlur svg filter element.
# We loop over a set of stdDeviation values, modify the base.svg file to set the stdDeviation,
# and export the modified SVG to a PNG file using Inkscape's command line interface.

# Define the base SVG file and output directory
BASE_SVG="/data/base.svg"
OUTPUT_DIR="/data"
FILTER_ID="feGaussianBlur31471"  # The id of the feGaussianBlur filter in the SVG

# Define the stdDeviation values to iterate over
STD_DEVIATION_START=0
STD_DEVIATION_END=20
STD_DEVIATION_STEP=1

# Initialize the stdDeviation value
STD_DEVIATION_VALUE=$STD_DEVIATION_START

# Loop over the stdDeviation values
while [ $STD_DEVIATION_VALUE -le $STD_DEVIATION_END ]; do

    # Access the base SVG file and modify it in place.

    # Fine the following line and modify the stdDeviation value to the current STD_DEVIATION_VALUE in the loop:
    # <feGaussianBlur in="SourceGraphic" stdDeviation="2" result="blur1" id="feGaussianBlur31471" />

    sed -i "s/stdDeviation=\"[0-9]\+\"/stdDeviation=\"$STD_DEVIATION_VALUE\"/" "$BASE_SVG"
    echo "Set stdDeviation to $STD_DEVIATION_VALUE in $BASE_SVG."

    # Define the output PNG file name
    OUTPUT_PNG="$OUTPUT_DIR/drawing_blur_${STD_DEVIATION_VALUE}.png"
    # Export the modified SVG to PNG using Inkscape's command line interface
    inkscape "$BASE_SVG" --export-type="png" --export-filename="$OUTPUT_PNG"
    echo "Exported PNG with stdDeviation $STD_DEVIATION_VALUE to $OUTPUT_PNG."

    # Increment the stdDeviation value
    STD_DEVIATION_VALUE=$((STD_DEVIATION_VALUE + STD_DEVIATION_STEP))
done
echo "All exports completed."
