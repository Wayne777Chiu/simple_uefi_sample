unzip ./edk2-stable202102.zip                                                   -d ../../code/edk2/
unzip ./update_pkg/submodule-BaseTools-Source-C-BrotliCompress-brotli.zip              -d ../../code/edk2/
unzip ./update_pkg/submodule-MdeModulePkg-Library-BrotliCustomDecompressLib-brotli.zip -d ../../code/edk2/
unzip ./update_pkg/submodule-MdeModulePkg-Universal-RegularExpressionDxe-oniguruma.zip -d ../../code/edk2/
unzip ./update_pkg/submodule-CryptoPkg-Library-OpensslLib-openssl.zip                  -d ../../code/edk2/
unzip ./update_pkg/submodule-RedfishPkg-Library-JsonLib-jansson.zip                    -d ../../code/edk2/
unzip ./update_pkg/submodule-UnitTestFrameworkPkg-Library-CmockaLib-cmocka.zip         -d ../../code/edk2/
unzip ./update_pkg/submodule-SoftFloat.zip                                             -d ../../code/edk2/


cp -r ./oem_pkg/AdvEcPkg  ../../code/edk2/
#cp -r ./pkg/AdvEcPkg/* .
cp -r ./update_pkg/edk2-libc/* ../../code/edk2/

#cp ./bak_pkg/MdePkg/Library/BaseLib/String.c                     ../../code/edk2/MdePkg/Library/BaseLib/
#cp ./bak_pkg/MdePkg/Include/Library/BaseLib.h                    ../../code/edk2/MdePkg/Include/Library/
cp ./bak_pkg/StdLib/LibC/Wchar/Concatenation.c                    ../../code/edk2/StdLib/LibC/Wchar/
cp ./bak_pkg/StdLib/LibC/Wchar/Copying.c                          ../../code/edk2/StdLib/LibC/Wchar/
cp ./bak_pkg/StdLib/LibC/String/Concatenation.c                   ../../code/edk2/StdLib/LibC/String/
cp ./bak_pkg/StdLib/LibC/String/Copying.c                         ../../code/edk2/StdLib/LibC/String/
cp ./bak_pkg/StdLib/Include/string.h                              ../../code/edk2/StdLib/Include/
cp ./bak_pkg/StdLib/LibC/StdLib/Environs.c                        ../../code/edk2/StdLib/LibC/StdLib/
cp ./bak_pkg/StdLib/Include/stdlib.h                              ../../code/edk2/StdLib/Include/
cp ./bak_pkg/StdLib/LibC/Uefi/Devices/Utility/Path.c              ../../code/edk2/StdLib/LibC/Uefi/Devices/Utility/
cp ./bak_pkg/StdLib/LibC/StdLib/realpath.c                        ../../code/edk2/StdLib/LibC/StdLib/
cp ./bak_pkg/StdLib/LibC/Uefi/SysCalls.c                          ../../code/edk2/StdLib/LibC/Uefi/
cp ./bak_pkg/AdvEcPkg/Applications/AecMonitor/lib/text/t_scrcap.c ../../code/edk2/AdvEcPkg/Applications/AecMonitor/lib/text/
cp ./bak_pkg/AdvEcPkg/AdvEcPkg.dsc                                ../../code/edk2/AdvEcPkg/
cd ../../code/edk2

make -C BaseTools
#

. edksetup.sh
sed -i 's/TARGET_ARCH           = IA32/TARGET_ARCH           = X64/g'                                            ./Conf/target.txt
sed -i 's/TOOL_CHAIN_TAG        = VS2015x86/TOOL_CHAIN_TAG        = GCC5/g'                                      ./Conf/target.txt
sed -i 's/ACTIVE_PLATFORM       = EmulatorPkg\/EmulatorPkg.dsc/ACTIVE_PLATFORM       = AdvEcPkg\/AdvEcPkg.dsc/g' ./Conf/target.txt
sed -i 's/TARGET                = DEBUG/TARGET                = RELEASE/g'                                       ./Conf/target.txt
