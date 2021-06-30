// pcdlib.h   //edk2-stable202102\MdePkg\Include\Library\PcdLib.h
#define FeaturePcdGet(TokenName)            _PCD_GET_MODE_BOOL_##TokenName


 if (FeaturePcdGet (PcdHelloWorldPrintEnable)) {}
//     -->    _PCD_GET_MODE_BOOL_PcdHelloWorldPrintEnable



//  MdeModulePkg.dec    //edk2-stable202102\MdeModulePkg\MdeModulePkg.dec
gEfiMdeModulePkgTokenSpaceGuid.PcdHelloWorldPrintEnable|TRUE|BOOLEAN|0x0001200a

//  MdeModulePkg.uni    //edk2-stable202102\MdeModulePkg\MdeModulePkg.uni
#string STR_gEfiMdeModulePkgTokenSpaceGuid_PcdHelloWorldPrintEnable_PROMPT  #language en-US "Enable HelloWorld print"

#string STR_gEfiMdeModulePkgTokenSpaceGuid_PcdHelloWorldPrintEnable_HELP  #language en-US "Indicates if HelloWorld Application will print the verbose information. This PCD is a sample to explain FeatureFlag PCD usage.<BR><BR>\n"
                                                                                          "TRUE  - HelloWorld Application will print the verbose information.<BR>\n"
                                                                                          "FALSE - HelloWorld Application will not print the verbose information.<BR>"