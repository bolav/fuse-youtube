#!/bin/sh
# @(MSG_ORIGIN)
# @(MSG_EDIT_WARNING)
set -e
cd "`dirname "$0"`"

mkdir -p data
if [ -f "Podfile" ]
then
	pod install
	xcodebuild -workspace "@(Project.Name).xcworkspace" -scheme "@(Project.Name)" -derivedDataPath build
	exit $?
fi

xcodebuild -project "@(Project.Name).xcodeproj"
