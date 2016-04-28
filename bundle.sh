#!/usr/bin/env bash

clear

sudo passenger stop
echo "passenger stopped ........................."
echo

#sleep 3s

BUILD_FOLDER=../tmp
BUNDLE_FOLDER=$BUILD_FOLDER/bundle

mkdir -p $BUILD_FOLDER
rm -f $BUILD_FOLDER/bundle.tar.gz

meteor bundle $BUILD_FOLDER/bundle.tar.gz
echo
echo "meteor bundle success..............."
echo

(cd $BUILD_FOLDER && tar xzf bundle.tar.gz)
echo
echo "unzip bundle.tar.gz success..............."
echo

cp Passengerfile.json $BUNDLE_FOLDER/Passengerfile.json
cp settings.json $BUNDLE_FOLDER/settings.json
cp production_start.sh $BUNDLE_FOLDER/production_start.sh
echo
echo "copying json files success ..............."
echo

(cd $BUNDLE_FOLDER/programs/server && npm install --production)
echo
echo "npm install success..............."
echo

rm -rf /var/www/snapback/bundle.old
echo
echo "cleaning up old bundle success..............."
mv /var/www/snapback/bundle /var/www/snapback/bundle.old
echo
echo "move current bundle to old success..............."
mv /var/www/snapback/tmp/bundle /var/www/snapback/bundle
echo
echo "move new bundle success..............."
echo

#sleep 3s

#passenger-config restart-app $BUNDLE
cd /var/www/snapback/bundle
./production_start.sh
#/var/www/snapback/bundle/production_start.sh
echo
echo "passenger started ...................."
