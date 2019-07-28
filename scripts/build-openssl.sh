#!/bin/sh

#git clone https://github.com/pybee/Python-Apple-support
#cd Python-Apple-support
#git checkout 60b990128d5f1f04c336ff66594574515ab56604
#cd ..

makefile="Python-Apple-support/Makefile"

if ! grep -Fq "arm64_32" $makefile; then
    sed -i '' "s/watchos-version-min=4.0/watchos-version-min=2.0/g" $makefile
    sed -i '' "s/ watchos.armv7k/ watchos.armv7k watchos.arm64_32/g" $makefile
    sed -i '' $'s/watchos.armv7k=-fembed-bitcode/watchos.armv7k=-fembed-bitcode\\\nCFLAGS-watchos.arm64_32=-fembed-bitcode/g' $makefile
fi

#TODO: change openssl version
platforms="macOS iOS watchOS tvOS"
for platform in $platforms;
do
  echo $platform
  cd Python-Apple-support
  #NB: -j will fail
  make OpenSSL-$platform
  cd ..
  rm -rf third_party/openssl/$platform
  mkdir -p third_party/openssl/$platform/lib
  cp ./Python-Apple-support/build/$platform/libcrypto.a third_party/openssl/$platform/lib/
  cp ./Python-Apple-support/build/$platform/libssl.a third_party/openssl/$platform/lib/
  cp -r ./Python-Apple-support/build/$platform/Support/OpenSSL/Headers/ third_party/openssl/$platform/include
done
