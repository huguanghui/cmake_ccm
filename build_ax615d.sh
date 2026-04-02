#!/bin/sh

SOURCE_DIR=$(pwd)
BUILD_DIR=build_ax615d
INSTALL_DIR=output/ax615d
PRESET="arm-ax615d"
MAKEFLAGS='--no-print-directory'

if [ ! -d "${BUILD_DIR}" ] || [ ! -f "${BUILD_DIR}/CMakeCache.txt" ]; then
    echo "Configuring build (preset: ${PRESET})..."
    cmake --preset ${PRESET}
else
    echo "Build directory already configured, skipping configure."
fi
cmake --build ${BUILD_DIR} -j$(nproc)
cmake --install ${BUILD_DIR}

cp ${INSTALL_DIR}/bin/* /var/lib/tftpboot/
