#!/bin/bash

if [ $# -ne 2 ]; then
echo 1>&2 "Please, use the parameters tag and new value."
exit 127
fi

echo $1
xml_file="goodnews.xml"
tag=$1
new_value=$2

temporary="temp_file.temp"

echo " ">> $xml_file
tag_value=$(grep "<$tag>.*<.$tag>" $xml_file | sed -e "s/^.*<$tag/<$tag/" | cut -f2 -d">"| cut -f1 -d"<")

echo "Found tag value $tag_value..."
sed -e "s/<$tag>$tag_value<\/$tag>/<$tag>$new_value<\/$tag>/g" $xml_file > $temporary

echo "Changing $tag to $new_value..."

chmod 666 $xml_file
mv $temporary $xml_file
