#!/bin/sh
ios_min_version="9.0"
osx_min_version="10.9"
tvos_min_version="9.0"
watchos_min_version="4.0"

td_path=$(grealpath td)
root_path=$(grealpath ..)

#rm -rf build
#mkdir -p build
cd build

#platforms="macOS iOS watchOS tvOS"
platforms="watchOS"

for platform in $platforms;
do
  echo "Platform = ${platform} Simulator = ${simulator}"
  openssl_path=$(grealpath ../third_party/openssl/${platform})
  echo "OpenSSL path = ${openssl_path}"
  openssl_crypto_library="${openssl_path}/lib/libcrypto.a"
  openssl_ssl_library="${openssl_path}/lib/libssl.a"
  options="$options -DOPENSSL_FOUND=1"
  options="$options -DOPENSSL_CRYPTO_LIBRARY=${openssl_crypto_library}"
  #options="$options -DOPENSSL_SSL_LIBRARY=${openssl_ssl_library}"
  options="$options -DOPENSSL_INCLUDE_DIR=${openssl_path}/include"
  options="$options -DOPENSSL_LIBRARIES=${openssl_crypto_library};${openssl_ssl_library}"
  options="$options -DCMAKE_BUILD_TYPE=Release"

  if [[ $platform = "macOS" ]]; then
    build="build-${platform}"
    install="install-${platform}"
    rm -rf $build
    mkdir -p $build
    mkdir -p $install
    cd $build
    cmake $td_path $options -DCMAKE_INSTALL_PREFIX=../${install} -DCMAKE_OSX_DEPLOYMENT_TARGET=$osx_min_version
    make -j3 install || exit
    cd ..
    mkdir -p $platform

    for i in $install/lib/*.a;
    do
        [ -f "$i" ] || break

        cp $i $platform/$(basename -- $i)
    done
  else
#    simulators="0 1"
    simulators="1"

    for simulator in $simulators;
    do
      build="build-${platform}"
      install="install-${platform}"

      if [[ $simulator = "1" ]]; then
        build="${build}-simulator"
        install="${install}-simulator"
        ios_platform="SIMULATOR"
      else
        ios_platform="OS"
      fi

      if [[ $platform = "watchOS" ]]; then
        ios_platform="WATCH${ios_platform}"
        min_version=$watchos_min_version
      fi

      if [[ $platform = "tvOS" ]]; then
        ios_platform="TV${ios_platform}"
        min_version=$tvos_min_version
      fi

      if [[ $platform = "iOS" ]]; then
        min_version=$ios_min_version
      fi

      echo $ios_platform
      rm -rf $build
      mkdir -p $build
      mkdir -p $install
      cd $build
      cmake $td_path $options -DIOS_PLATFORM=${ios_platform} -DCMAKE_TOOLCHAIN_FILE=${td_path}/../iOS.cmake -DCMAKE_INSTALL_PREFIX=../${install} -DIOS_DEPLOYMENT_TARGET=$min_version
      make -j3 install || exit
      cd ..
    done

    mkdir -p $platform

    install="install-${platform}"

    for i in $install/lib/*.a;
    do
        [ -f "$i" ] || break

        name="$(basename -- $i)"

        lib_simulator="install-${platform}-simulator/lib/$name"
        lipo -create $i $lib_simulator -o $platform/$name
    done
  fi

  mkdir -p $root_path/$platform/
  for i in $platform/*.a;
  do
  [ -f "$i" ] || break

    cp $i $root_path/$platform/
  done

  for i in ../third_party/openssl/$platform/lib/*.a;
  do
  [ -f "$i" ] || break

    cp $i $root_path/$platform/
  done
done
