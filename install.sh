#!/bin/sh

shellPath=$(cd "$(dirname "$0")"; pwd)
echo cd $shellPath

cp -rf $shellPath/.vim* ~/

echo cp done

