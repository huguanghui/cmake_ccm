set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_PROCESSOR mips)

set(TOOLCHAIN_ROOT_PATH
    /opt/mips-gcc720-glibc229-r5.1.9
    CACHE STRING "root path to toolchain")

# Specify the cross compiler.
set(CMAKE_C_COMPILER
    /opt/mips-gcc720-glibc229-r5.1.9/bin/mips-linux-gnu-gcc
    CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER
    /opt/mips-gcc720-glibc229-r5.1.9/bin/mips-linux-gnu-g++
    CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER
    /opt/mips-gcc720-glibc229-r5.1.9/bin/mips-linux-gnu-gcc
    CACHE FILEPATH "ASM compiler")

set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_ROOT_PATH}/mips-linux-gnu")
set(CMAKE_SYSROOT "${TOOLCHAIN_ROOT_PATH}/mips-linux-gnu/libc")

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} -muclibc -march=mips32r2 -funwind-tables -rdynamic -ffunction-sections -fdata-sections -Wall"
)

set(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -muclibc -march=mips32r2 -funwind-tables -rdynamic -ffunction-sections -fdata-sections -Wall"
)
set(CMAKE_LD_FLAGS "${CMAKE_CXX_FLAGS} -muclibc")

# Search libraries only under *target* paths.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
