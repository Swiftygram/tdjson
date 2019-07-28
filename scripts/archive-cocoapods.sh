#!/bin/bash

cd ..

output_name="tdjson.cocoapods.tar.gz"

tar -c -z --exclude='.DS_Store' -f $output_name Source/ iOS/ watchOS/ tvOS/ macOS/ tdjson.podspec "LICENSE_1_0.txt" "README.md"
