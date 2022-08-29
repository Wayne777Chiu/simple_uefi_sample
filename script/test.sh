#!/bin/bash -x

BUILD_SHELL_VERSION=0.01
GOTO_ROOT=../..
KEYSEARCH='edk2'
EDK2VER=''
TARGET_FOLDER=$(find ${GOTO_ROOT} -maxdepth 1 -type d -name '*'${KEYSEARCH}'*' -print -quit | sed 's/..\///g')
#/edk2-stable202111_bak
# cd ${TARGET_FOLDER}
#mkdir hello
if [ "${TARGET_FOLDER}" = "" ]; then
    echo "<ERR>: No such file or directory include the string '${KEYSEARCH}'" && exit 1
else
    EDK2VER=$(echo ${TARGET_FOLDER} | sed 's/edk2-stable//g' | sed 's/_bak//g')
fi

echo  ${TARGET_FOLDER}
echo ${EDK2VER}

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

cd ${KEYSEARCH}_${EDK2VER}
git clone https://github.com/tianocore/edk2-libc.git

# sudo apt install g++
# sudo apt install uuid-dev
# sudo apt install python
make -C BaseTools
# . edksetup.sh