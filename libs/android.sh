#!/bin/sh
mkdir dl
cd dl
wget https://developers.google.com/youtube/android/player/downloads/YouTubeAndroidPlayerApi-1.2.2.zip
cd ..
mkdir android
cd android
unzip ../dl/YouTubeAndroidPlayerApi-1.2.2.zip
