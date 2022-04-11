#!/bin/bash

echo $1

plutil -convert json xcui.xctestrun -o xcui.json
node xcui.js "$1" "$2" "$3" "$4"
plutil -convert xml1 xcui.json -o xcui.xctestrun
