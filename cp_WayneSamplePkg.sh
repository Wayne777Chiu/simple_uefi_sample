cp -rf ./WayneSamplePkg                    ../edk2_202111/


cd ../edk2_202111
ls
echo cd ../edk2_202111
. edksetup.sh
pwd
sed -i 's/TARGET_ARCH           = IA32/TARGET_ARCH           = X64/g'                                            ./Conf/target.txt
sed -i 's/TOOL_CHAIN_TAG        = VS2015x86/TOOL_CHAIN_TAG        = GCC5/g'                                      ./Conf/target.txt
sed -i 's/ACTIVE_PLATFORM       = EmulatorPkg\/EmulatorPkg.dsc/ACTIVE_PLATFORM       = WayneSamplePkg\/WayneSamplePkg.dsc/g' ./Conf/target.txt
sed -i 's/TARGET                = DEBUG/TARGET                = RELEASE/g'  ./Conf/target.txt
