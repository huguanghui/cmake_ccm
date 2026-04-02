set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR x86_64)
set(CMAKE_CROSSCOMPILING FALSE)

set(CMAKE_C_COMPILER
    /usr/bin/gcc
    CACHE FILEPATH "C compiler")
set(CMAKE_CXX_COMPILER
    /usr/bin/g++
    CACHE FILEPATH "C++ compiler")
set(CMAKE_ASM_COMPILER
    /usr/bin/gcc
    CACHE FILEPATH "ASM compiler")

set(CMAKE_C_FLAGS
    "${CMAKE_C_FLAGS} -Wall -ffunction-sections -fdata-sections -fstack-protector -fno-omit-frame-pointer"
)
set(CMAKE_CXX_FLAGS
    "${CMAKE_CXX_FLAGS} -Wall -ffunction-sections -fdata-sections -fstack-protector -fno-omit-frame-pointer"
)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE BOTH)
