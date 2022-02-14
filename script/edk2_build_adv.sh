#!/bin/bash -x

BUILD_SHELL_VERSION=0.01
GOTO_ROOT=../..
KEYSEARCH='edk2'
EDK2VER=''
TARGET_FOLDER=$(find ${GOTO_ROOT} -maxdepth 1 -type d -name '*'${KEYSEARCH}'*' -print -quit | sed 's/..\///g')
#/edk2-stable202111_bak

BACKFLODERFLAG=0
#check the folder is bakup or workspace folder.
if [[ "${TARGET_FOLDER}" == *"_bak"* ]]; then
    BACKFLODERFLAG=1
    echo "<INFO>: Please execute edk2_simple_sample.sh first." && exit 1
fi

if [ "${TARGET_FOLDER}" = "" ]; then
    echo "<ERR>: No such file or directory include the string '${KEYSEARCH}'" && exit 1
else
    if [ ${BACKFLODERFLAG} -eq "1" ]; then
        EDK2VER=$(echo ${TARGET_FOLDER} | sed 's/edk2-stable//g' | sed 's/_bak//g')
    else
        EDK2VER=$(echo ${TARGET_FOLDER} | sed 's/edk2_//g' )
    fi
fi

echo ${TARGET_FOLDER}
echo ${EDK2VER}

cd ${GOTO_ROOT}
pwd

ADV_COMMOM_FOLDER=adv_bak
ADV_FW_TOOL_FOLDER="fw_tools_uefi"
ADV_DOWNGRADE_FOLDER="downgrade_bak"
if [[ ! -d "${ADV_COMMOM_FOLDER}/${ADV_FW_TOOL_FOLDER}" ]]; then
    unzip ./${ADV_COMMOM_FOLDER}/${ADV_FW_TOOL_FOLDER}.zip     -d  ./${ADV_COMMOM_FOLDER}
fi
#copy advECPkg for testing 
cp -r ./${ADV_COMMOM_FOLDER}/${ADV_FW_TOOL_FOLDER}/AdvEcPkg  ./${KEYSEARCH}_${EDK2VER} 

if [[ -d "${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}" ]]; then
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/Wchar/Concatenation.c                    ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/Wchar/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/Wchar/Copying.c                          ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/Wchar/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/String/Concatenation.c                   ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/String/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/String/Copying.c                         ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/String/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/Include/string.h                              ./${KEYSEARCH}_${EDK2VER}/StdLib/Include/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/StdLib/Environs.c                        ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/StdLib/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/Include/stdlib.h                              ./${KEYSEARCH}_${EDK2VER}/StdLib/Include/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/Uefi/Devices/Utility/Path.c              ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/Uefi/Devices/Utility/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/StdLib/realpath.c                        ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/StdLib/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/StdLib/LibC/Uefi/SysCalls.c                          ./${KEYSEARCH}_${EDK2VER}/StdLib/LibC/Uefi/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/AdvEcPkg/Applications/AecMonitor/lib/text/t_scrcap.c ./${KEYSEARCH}_${EDK2VER}/AdvEcPkg/Applications/AecMonitor/lib/text/
    cp ./${ADV_COMMOM_FOLDER}/${ADV_DOWNGRADE_FOLDER}/AdvEcPkg/AdvEcPkg.dsc                                ./${KEYSEARCH}_${EDK2VER}/AdvEcPkg/
fi

cd ${KEYSEARCH}_${EDK2VER}
. edksetup.sh
sed -i 's/TARGET_ARCH           = IA32/TARGET_ARCH           = X64/g'                                            ./Conf/target.txt
sed -i 's/TOOL_CHAIN_TAG        = VS2015x86/TOOL_CHAIN_TAG        = GCC5/g'                                      ./Conf/target.txt
sed -i 's/ACTIVE_PLATFORM       = EmulatorPkg\/EmulatorPkg.dsc/ACTIVE_PLATFORM       = AdvEcPkg\/AdvEcPkg.dsc/g' ./Conf/target.txt
sed -i 's/TARGET                = DEBUG/TARGET                = RELEASE/g'                                       ./Conf/target.txt
