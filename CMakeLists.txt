cmake_minimum_required(VERSION 3.12)

project(cmake_ccm VERSION 0.0.1)

set(CMAKE_C_STANDARD 99)

enable_language(C CXX ASM)

if(PLATFORM STREQUAL "x86")
  enable_testing()
endif()

# Point CMake at any custom modules we may ship
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

# 编译调试开关 set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_VERBOSE_MAKEFILE OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_INSTALL_MESSAGE NEVER)

set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -O0")
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O0")

set(CMAKE_C_FLAGS_RELEASE "-Os -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -DNDEBUG")

string(TOLOWER "${CMAKE_BUILD_TYPE}" _build_type)

if(NOT WIN32)
  string(ASCII 27 Esc)
  set(ColourReset "${Esc}[m")
  set(ColourBold "${Esc}[1m")
  set(Red "${Esc}[31m")
  set(Green "${Esc}[32m")
  set(Yellow "${Esc}[33m")
  set(Blue "${Esc}[34m")
  set(Magenta "${Esc}[35m")
  set(Cyan "${Esc}[36m")
  set(White "${Esc}[37m")
  set(BoldRed "${Esc}[1;31m")
  set(BoldGreen "${Esc}[1;32m")
  set(BoldYellow "${Esc}[1;33m")
  set(BoldBlue "${Esc}[1;34m")
  set(BoldMagenta "${Esc}[1;35m")
  set(BoldCyan "${Esc}[1;36m")
  set(BoldWhite "${Esc}[1;37m")
endif()

message("${BoldMagenta}slient mode${ColourReset}")
set_property(GLOBAL PROPERTY RULE_MESSAGES OFF)

find_package(Threads REQUIRED)

message("${BoldGreen}PLATFORM: ${PLATFORM}${ColourReset}")

# turbojpeg
if(PLATFORM STREQUAL "x86")
  set(TURBOJPEG_INC_DIR "${CMAKE_SOURCE_DIR}/deps/x86/jpeg_turbo/include/")
  set(TURBOJPEG_LIB_DIR "${CMAKE_SOURCE_DIR}/deps/x86/jpeg_turbo/lib")
elseif(PLATFORM STREQUAL "ax615d")
  set(TURBOJPEG_INC_DIR "${CMAKE_SOURCE_DIR}/deps/ax615d/jpeg_turbo/include/")
  set(TURBOJPEG_LIB_DIR "${CMAKE_SOURCE_DIR}/deps/ax615d/jpeg_turbo/lib")
elseif(PLATFORM STREQUAL "t41nq")
  set(TURBOJPEG_INC_DIR "${CMAKE_SOURCE_DIR}/deps/t41nq/jpeg_turbo/include/")
  set(TURBOJPEG_LIB_DIR "${CMAKE_SOURCE_DIR}/deps/t41nq/jpeg_turbo/lib")
else()
  message(FATAL_ERROR "Unsupported platform: ${PLATFORM}")
endif()
set(TURBOJPEG_LIB_LINKS "turbojpeg")

include(CheckIPOSupported)
check_ipo_supported(RESULT lto_supported OUTPUT lto_error)
if(lto_supported)
  message(STATUS "LTO is supported by the cross-compiler")
else()
  message(WARNING "LTO not supported: ${lto_error}")
endif()

include(TargetFunc)

add_subdirectory(src)

if(EXISTS "${CMAKE_BINARY_DIR}/compile_commands.json")
  execute_process(
    COMMAND
      ${CMAKE_COMMAND} -E create_symlink
      "${CMAKE_BINARY_DIR}/compile_commands.json"
      "${CMAKE_SOURCE_DIR}/compile_commands.json")
endif()
