#!/bin/bash
ios_min_version="9.0"
osx_min_version="10.9"
tvos_min_version="8.0"
watchos_min_version="2.0"

version="1.4.0"

platforms="macOS iOS watchOS tvOS"

for platform in $platforms;
do
    lowercased_platform=$(echo "$platform" | tr '[:upper:]' '[:lower:]')
    filename="tdjson-$lowercased_platform.podspec"

    cp tdjson-template.podspec $filename

    sed -i '' "s/{version}/$version/g" $filename
    sed -i '' "s/{platform}/$platform/g" $filename
    sed -i '' "s/{lowercased_platform}/$lowercased_platform/g" $filename
done
