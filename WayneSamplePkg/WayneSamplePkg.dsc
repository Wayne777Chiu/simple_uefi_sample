##  @file WayneSamplePkg.dsc
# Shell Package
#
# Copyright (c) 2021 - 2021, Wayne Chiu. All rights reserved.<BR>
#
#    This program and the accompanying materials
#    are licensed and made available under the terms and conditions of the BSD License
#    which accompanies this distribution. The full text of the license may be found at
#    http://opensource.org/licenses/bsd-license.php
#
#    THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
#    WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
#
##

[Defines]
 PLATFORM_NAME                  = WayneSimple
 PLATFORM_GUID                  = e0467968-15fa-4013-866e-d7e4594973b3
 PLATFORM_VERSION               = 0.1
 DSC_SPECIFICATION              = 0x00010006
 OUTPUT_DIRECTORY               = Build/WayneSample
 SUPPORTED_ARCHITECTURES        = IA32|X64
 BUILD_TARGETS                  = DEBUG|RELEASE
 SKUID_IDENTIFIER               = DEFAULT

[LibrearyClasses]
 #  
 # Entry point
 # 

 #  
 # Basic
 # 

 #  
 # UEFI & PI 
 # 

 #  
 # Generic Modules
 # 

 #  
 # Misc
 # 

 [Component]
   WayneSamplePkg/Application/Snake/Snake.inf
