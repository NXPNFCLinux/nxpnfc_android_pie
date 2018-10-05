#!/bin/bash
echo
echo "+++ Installing NXP-NCI NFC support for PN7150 +++"

echo
echo "- patching required files"
cd $ANDROID_BUILD_TOP/hardware/nxp/nfc
patch -p1 <$ANDROID_BUILD_TOP/vendor/nxp/nfc/patches/hardware_nxp_nfc.patch
cd $ANDROID_BUILD_TOP/packages/apps/Nfc
patch -p1 <$ANDROID_BUILD_TOP/vendor/nxp/nfc/patches/packages_apps_Nfc.patch
cd $ANDROID_BUILD_TOP

echo
echo "+++ NXP-NCI NFC support installation completed +++"
exit 0

