set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(TOOLCHAIN_ROOT_PATH
    /opt/arm-rel-linux-uclibcgnueabihf
    CACHE STRING "root path to toolchain")

# Specify the cross compiler.
set(CMAKE_C_COMPILER
    /opt/arm-rel-linux-uclibcgnueabihf/bin/arm-rel-linux-uclibcgnueabihf-gcc
    CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER
    /opt/arm-rel-linux-uclibcgnueabihf/bin/arm-rel-linux-uclibcgnueabihf-g++
    CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER
    /opt/arm-rel-linux-uclibcgnueabihf/bin/arm-rel-linux-uclibcgnueabihf-gcc
    CACHE FILEPATH "ASM compiler")

set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_ROOT_PATH}/arm-rel-linux-uclibcgnueabihf")

set(CMAKE_SYSROOT
    "${TOOLCHAIN_ROOT_PATH}/arm-rel-linux-uclibcgnueabihf/sysroot")

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} -funwind-tables -rdynamic -ffunction-sections -fdata-sections -fstack-protector -fno-omit-frame-pointer -Wl,--build-id=sha1 -Wall"
)
set(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -funwind-tables -rdynamic -ffunction-sections -fdata-sections -fstack-protector -fno-omit-frame-pointer -Wl,--build-id=sha1 -Wall"
)

# Search libraries only under *target* paths.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
