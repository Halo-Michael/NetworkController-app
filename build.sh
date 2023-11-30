#!/bin/bash
xcodebuild clean build -quiet CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO PRODUCT_BUNDLE_IDENTIFIER="com.michael.networkcontroller" -sdk iphoneos -configuration Release
ldid -Snetworkcontroller/networkcontroller.entitlements -Icom.michael.networkcontroller build/Release-iphoneos/Networkcontroller.app/Networkcontroller
cd build/Release-iphoneos
ln -s ./ Payload
zip -r9 Networkcontroller.ipa Payload/Networkcontroller.app
mv Networkcontroller.ipa ../..
