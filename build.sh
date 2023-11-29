#!/bin/bash
xcodebuild clean build -quiet CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO PRODUCT_BUNDLE_IDENTIFIER="com.michael.networkfixer" -sdk iphoneos -configuration Release
ldid -Snetworkfixer/networkfixer.entitlements -Icom.michael.networkfixer build/Release-iphoneos/Networkfixer.app/Networkfixer
cd build/Release-iphoneos
ln -s ./ Payload
zip -r9 Networkfixer.ipa Payload/Networkfixer.app
mv Networkfixer.ipa ../..
