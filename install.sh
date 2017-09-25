#!/bin/sh

shellPath=$(cd "$(dirname "$0")"; pwd)
echo cd $shellPath

cp -rf $shellPath/.vim* ~/
cp -rf $shellPath/.tmux.conf ~/

echo cp done

