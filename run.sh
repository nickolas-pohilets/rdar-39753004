#!/bin/bash

if [[ "$#" -eq 0 ]]
then
	echo "Usage: run.sh DEVICE_ID_1 DEVICE_ID_2 ... DEVICE_ID_N"
	exit 1
fi

xcodebuild -version

mkdir -p ./deriveddata/build
xcodebuild \
	-project CrashInTest.xcodeproj \
	-scheme CrashInTestUITests \
	-destination "generic/platform=iOS Simulator" \
	-derivedDataPath ./deriveddata/build \
	build-for-testing

PIDS=()
for DEVICE_ID in "$@"
do
	rm -Rf ./deriveddata/$DEVICE_ID
	mkdir -p ./deriveddata/$DEVICE_ID/Build
	ln -s $PWD/deriveddata/build/Build/Products ./deriveddata/$DEVICE_ID/Build/Products
	xcodebuild \
		-project CrashInTest.xcodeproj \
		-scheme CrashInTestUITests \
		-destination "id=$DEVICE_ID" \
		-derivedDataPath ./deriveddata/$DEVICE_ID \
		test-without-building &
	PIDS+=($!)
done

for PID in "${PIDS[@]}";
do
    wait $PID
done
