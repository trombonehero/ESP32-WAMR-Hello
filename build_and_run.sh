#!/bin/bash -e

# Copyright (C) 2019-21 Intel Corporation and others.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

ESP32_TARGET="esp32"
ESP32C3_TARGET="esp32c3"
ESP32S3_TARGET="esp32s3"
ESP32C6_TARGET="esp32c6"

usage ()
{
        echo "USAGE:"
        echo "$0 $ESP32_TARGET|$ESP32C3_TARGET|$ESP32S3_TARGET"
        echo "Example:"
        echo "        $0 $ESP32_TARGET"
        echo "        $0 $ESP32C3_TARGET"
        echo "        $0 $ESP32S3_TARGET"
        echo "        $0 $ESP32C6_TARGET"
        exit 1
}

if [ $# != 1 ] ; then
        usage
fi

TARGET=$1

if [[ -z "${WAMR_PATH}" ]]; then
        export WAMR_PATH=$PWD/../../..
fi

rm -rf build
idf.py set-target $TARGET
idf.py build
idf.py flash

#!/bin/bash

# This script builds the ESP-IDF project.
# Make sure to set the IDF_PATH environment variable before running this script.

set -e

if [ -z "$IDF_PATH" ]; then
  echo "Error: IDF_PATH is not set. Please set it to your ESP-IDF directory."
  exit 1
fi

# Set the target chip (e.g., esp32, esp32s2)
TARGET="esp32"

# Export IDF environment variables
source $IDF_PATH/export.sh

# Build the project
idf.py set-target $TARGET
idf.py build


