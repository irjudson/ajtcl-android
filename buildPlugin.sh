#!/usr/bin/env sh
#
# This pulls bits from the AJTCL directory where they should have been created.
# 
# (c) 2015 Microsoft
#

if [ "$1x" == "x" ]; then
	echo "Root directory not set. Exiting..."
	exit 1
else
	PLUGINDIR="$1"
fi

if [ "$2x" == "x" ]; then
	echo "AllJoyn Thin Client Library Root not set. Exiting..."
	exit 1
else
	AJTCL_ROOT="$2"
fi

if [ "$AJTCL_ROOT" == "" ]; then
	echo "Please set your AllJoyn Thin Client Library Root directory (AJTCL_ROOT) to the location of your AJTCL code and run the build process with the LANG=java option to generate the java bindings."
	exit 1
fi

cp $AJTCL_ROOT/swig/alljoyn_java_wrap.c $PLUGINDIR/jni/alljoyn.c

rm $PLUGINDIR/src/alljoyn/*
cp $AJTCL_ROOT/swig/java/* $PLUGINDIR/src/alljoyn/
javac $PLUGINDIR/src/alljoyn/*.java
jar -cvf $PLUGINDIR/alljoyn.jar -C $PLUGINDIR/src alljoyn

ndk-build