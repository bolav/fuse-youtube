#!/bin/sh
# @(MSG_ORIGIN)
# @(MSG_EDIT_WARNING)
set -e
cd "`dirname "$0"`"

if [ -f "Podfile" ]
then
	pod install
fi

case $1 in
debug)
    echo "Opening Xcode"
    if [ -d "@(Project.Name).xcworkspace" ]
    then
	    open -aXcode "@(Project.Name).xcworkspace"
	    exit $?
	else
		open -aXcode "@(Project.Name).xcodeproj"
		exit $?
    fi
    ;;
esac

"@(Base.Directory)/bin/ios-deploy" --justlaunch --debug --bundle "build/@(Pbxproj.Configuration)-iphoneos/@(Project.Name).app" "$@"
