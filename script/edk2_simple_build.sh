#!/bin/bash -x
rm -rf ../../tmp
rm -rf ../../edk2_202111

BUILD_SHELL_VERSION=0.01
GOTO_ROOT=../..
KEYSEARCH='edk2'
EDK2VER=''
TARGET_FOLDER=$(find ${GOTO_ROOT} -maxdepth 1 -type d -name '*'${KEYSEARCH}'*' -print -quit | sed 's/..\///g')
#/edk2-stable202111_bak

function pause(){
  read -s -n 1 -p "Pressany key to continue..."
  echo ""
}


sudo apt install -y git g++ uuid-dev python3-distutils python-is-python3 nasm acpica-tools qemu

if [ "${TARGET_FOLDER}" = "" ]; then
    echo "<ERR>: No such file or directory include the string '${KEYSEARCH}'" && exit 1
else
    EDK2VER=$(echo ${TARGET_FOLDER} | sed 's/edk2-stable//g' | sed 's/_bak//g')
fi

echo ${TARGET_FOLDER}
echo ${EDK2VER}
# pause
cd ${GOTO_ROOT}
pwd

tar zxvf ./${TARGET_FOLDER}/edk2-edk2-stable202111.tar.gz -C .                
mv ${KEYSEARCH}-${KEYSEARCH}-stable${EDK2VER}  ${KEYSEARCH}_${EDK2VER}

unzip ./${TARGET_FOLDER}/submodule-BaseTools-Source-C-BrotliCompress-brotli               -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-CryptoPkg-Library-OpensslLib-openssl                   -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-MdeModulePkg-Library-BrotliCustomDecompressLib-brotli  -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-MdeModulePkg-Universal-RegularExpressionDxe-oniguruma  -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-RedfishPkg-Library-JsonLib-jansson                     -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-SoftFloat                                              -d ./${KEYSEARCH}_${EDK2VER}
unzip ./${TARGET_FOLDER}/submodule-UnitTestFrameworkPkg-Library-CmockaLib-cmocka          -d ./${KEYSEARCH}_${EDK2VER}

mkdir tmp
cd tmp
git clone https://github.com/tianocore/edk2-libc.git
cp -r ./edk2-libc/* ../${KEYSEARCH}_${EDK2VER}
cd..
rm -rf tmp

cd ../${KEYSEARCH}_${EDK2VER}
# sudo apt install g++
# sudo apt install uuid-dev
# sudo apt install python
# sudo apt install nasm
#    Issue: X11/X16: No such file or directory
# sudo apt install libx11-dev
#    Issue: X11/extensions/XShm.h: No such file or directory
# sudo apt install libxext-dev
#    Issue: /bin/sh: 1: iasl: not found
#  sudo apt install acpica-tools
#            // sudo apt install iasl
make -C BaseTools
. edksetup.sh

sed -i 's/TARGET_ARCH           = IA32/TARGET_ARCH           = X64/g'                       ./Conf/target.txt
sed -i 's/TOOL_CHAIN_TAG        = VS2015x86/TOOL_CHAIN_TAG        = GCC5/g'                 ./Conf/target.txt
# sed -i 's/ACTIVE_PLATFORM       = EmulatorPkg\/EmulatorPkg.dsc/ACTIVE_PLATFORM       = AdvEcPkg\/AdvEcPkg.dsc/g' ./Conf/target.txt
sed -i 's/TARGET                = DEBUG/TARGET                = RELEASE/g'                  ./Conf/target.txt