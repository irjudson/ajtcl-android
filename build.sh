#!/usr/bin/env sh
#
# This pulls bits from the AJTCL directory where they should have been created.
# 
# (c) 2015 Microsoft
#

if [ "$AJTCL_ROOT" == "" ]; then
	echo "Please set your AllJoyn Thin Client Library Root directory (AJTCL_ROOT) to the location of your AJTCL code and run the build process with the LANG=java option to generate the java bindings."
	exit 1
fi

cp $AJTCL_ROOT/swig/alljoyn_java_wrap.c jni/alljoyn.c

rm src/alljoyn/*
cp $AJTCL_ROOT/swig/java/* src/alljoyn/
javac src/alljoyn/*.java
jar -cvf alljoyn.jar -C src alljoyn

ndk-build