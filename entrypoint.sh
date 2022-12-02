#!/bin/bash
# =================================================================
#
# Authors: Benjamin Webb <bwebb@lincolninst.edu>
#
# Copyright (c) 2022 Benjamin Webb
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# =================================================================

export STAENV=""
if [ $2 -a ! $POSTGRES_TABLE ]; 
then 
    export STAENV="${STAENV}POSTGRES_TABLE=${2}\n"
elif [ ! $POSTGRES_TABLE ];
then
    export STAENV="${STAENV}POSTGRES_TABLE=sensorthings\n"
fi

if [ $3 -a ! $POSTGRES_USER ]; 
then 
    export STAENV="${STAENV}POSTGRES_USER=${3}\n"
elif [ ! $POSTGRES_USER ];
then
    export STAENV="${STAENV}POSTGRES_USER=sensorthings\n"
fi

if [ $4 -a ! $POSTGRES_PASS ]; 
then 
    export STAENV="${STAENV}POSTGRES_PASS=${4}\n"
elif [ ! $POSTGRES_PASS ];
then
    export STAENV="${STAENV}POSTGRES_PASS=ChangeMe\n"
fi

echo -e $STAENV > $PWD/sta.env

exec docker-compose --env-file $PWD/sta.env "$1"  -d
