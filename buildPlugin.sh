#!/usr/bin/env sh
#
# This pulls bits from the AJTCL directory where they should have been created.
# 
# (c) 2015 Microsoft
#

if [ "$1x" == "x" ]; then
	echo "AJTCL Android directory not set. Exiting..."
	exit 1
else
	PLUGINDIR="$1"
fi

if [ "$2x" == "x" ]; then
	echo "AJTCL Root not set. Exiting..."
	exit 1
else
	AJTCL_ROOT="$2"
fi


if [ "$NDK_ROOTx" == "x" ]; then
	echo "NDK_ROOT not set. Exiting..."
	exit 1
fi

# Copy the generated files
cp $AJTCL_ROOT/swig/alljoyn_java_wrap.c $PLUGINDIR/jni/alljoyn.c
mkdir -p $PLUGINDIR/src/alljoyn
cp $AJTCL_ROOT/swig/java/* $PLUGINDIR/src/alljoyn/

# Build the native assets
pushd $PLUGINDIR
AJTCL_ROOT=$AJTCL_ROOT $NDK_ROOT/ndk-build
popd