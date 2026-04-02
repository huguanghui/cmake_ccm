#!/bin/sh

SOURCE_DIR=$(pwd)
BUILD_DIR=build_x86
INSTALL_DIR="output/x86"
PRESET="x86-local"
MAKEFLAGS='--no-print-directory'

if [ ! -d "${BUILD_DIR}" ] || [ ! -f "${BUILD_DIR}/CMakeCache.txt" ]; then
    echo "Configuring build (preset: ${PRESET})..."
    cmake --preset ${PRESET}
else
    echo "Build directory already configured, skipping configure."
fi

echo "Building for architecture x86"
cmake --build ${BUILD_DIR} -j$(nproc)
cmake --install ${BUILD_DIR}
