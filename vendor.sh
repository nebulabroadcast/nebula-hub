#!/bin/bash
#
# Copyright (c) 2015 - 2020 imm studios, z.s.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
##############################################################################
## COMMON UTILS

base_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
temp_dir=/tmp/$(basename "${BASH_SOURCE[0]}")

function error_exit {
    printf "\n\033[0;31mInstallation failed\033[0m\n"
    cd ${base_dir}
    exit 1
}

function finished {
    printf "\n\033[0;92mInstallation completed\033[0m\n"
    cd ${base_dir}
    exit 0
}

#if [ "$(id -u)" != "0" ]; then
#   echo "This script must be run as root" 1>&2
#   error_exit
#fi
#
#if [ ! -d ${temp_dir} ]; then
#    mkdir ${temp_dir} || error_exit
#fi

## COMMON UTILS
##############################################################################

set -e

#
# Download third-party resources
#

if [ ! -d $base_dir/vendor ]; then
    mkdir $base_dir/vendor
fi

cd $base_dir/vendor

if [ ! -d bootstrap-4.5.0 ]; then
    wget https://github.com/twbs/bootstrap/archive/v4.5.0.tar.gz
    tar -xf v4.5.0.tar.gz
    rm v4.5.0.tar.gz
fi

if [ ! -d font-awesome-sass-5.12.0 ]; then
    wget https://github.com/FortAwesome/font-awesome-sass/archive/5.12.0.tar.gz
    tar -xf 5.12.0.tar.gz
    rm 5.12.0.tar.gz
fi

if [ ! -d roboto-1.1.0 ]; then
    wget https://github.com/FontFaceKit/roboto/archive/v1.1.0.tar.gz
    tar -xf v1.1.0.tar.gz
    rm v1.1.0.tar.gz
fi

if [ ! -d bootstrap-select-1.13.18 ]; then
    wget https://github.com/snapappointments/bootstrap-select/archive/v1.13.18.tar.gz
    tar -xf v1.13.18.tar.gz
    rm v1.13.18.tar.gz
fi

if [ ! -d gijgo-1.9.13 ]; then
    wget https://github.com/atatanasov/gijgo/archive/v1.9.13.tar.gz
    tar -xf v1.9.13.tar.gz
    rm v1.9.13.tar.gz
fi

if [ ! -d Inputmask-5.0.3 ]; then
    wget https://github.com/RobinHerbots/Inputmask/archive/5.0.3.tar.gz
    tar -xf 5.0.3.tar.gz
    rm 5.0.3.tar.gz
fi

if [ ! -f jquery-3.5.1.min.js ]; then
    wget https://code.jquery.com/jquery-3.5.1.min.js
fi

if [ ! -d resumablejs-1.0 ]; then
    wget https://github.com/martastain/resumablejs/archive/v1.0.tar.gz
    tar -xf v1.0.tar.gz
    rm v1.0.tar.gz
fi


#
# Copy to dist
#

cd $base_dir

# Fonts

if [ -d dist/static/fonts ]; then
    rm -rf dist/static/fonts
fi
mkdir dist/static/fonts
cp -r vendor/roboto-1.1.0/fonts dist/static/fonts/roboto
cp -r vendor/font-awesome-sass-5.12.0/assets/fonts/font-awesome dist/static/fonts/font-awesome

# Javascripts

VENDOR_DIR=dist/static/js/vendor
rm $VENDOR_DIR/*

cp vendor/bootstrap-4.5.0/dist/js/bootstrap.bundle.min.js $VENDOR_DIR/
cp vendor/bootstrap-4.5.0/dist/js/bootstrap.bundle.min.js.map $VENDOR_DIR/
cp vendor/bootstrap-select-1.13.18/dist/js/bootstrap-select.min.js $VENDOR_DIR/
cp vendor/bootstrap-select-1.13.18/dist/js/bootstrap-select.min.js.map $VENDOR_DIR/
cp vendor/gijgo-1.9.13/dist/modular/js/core.min.js $VENDOR_DIR/gijgo-core.js
cp vendor/gijgo-1.9.13/dist/modular/js/datepicker.min.js $VENDOR_DIR/gijgo-datepicker.js
cp vendor/Inputmask-5.0.3/dist/jquery.inputmask.min.js $VENDOR_DIR/
cp vendor/jquery-3.5.1.min.js $VENDOR_DIR/jquery.min.js
cp vendor/resumablejs-1.0/dist/resumable.js $VENDOR_DIR

cp vendor/gijgo-1.9.13/dist/modular/css/core.min.css dist/static/css/gijgo-core.css
cp vendor/gijgo-1.9.13/dist/modular/css/datepicker.min.css dist/static/css/gijgo-datepicker.css
