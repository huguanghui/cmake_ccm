# Common settings for projects

set(TARGET_LINK_OPTIONS "Threads::Threads" "dl" "m" "rt" "stdc++")

if(_build_type STREQUAL "release")
  list(APPEND TARGET_LINK_OPTIONS "-s -flto -Wl,-exclude-libs=ALL,-gc-sections")
endif()

macro(base_target name src_folder)
  aux_source_directory(${src_folder} MOD_SRC)

  include_directories(${src_folder})

  add_executable(${name} ${MOD_SRC})
  target_link_libraries(${name} ${TARGET_LINK_OPTIONS})

  install(TARGETS ${name} RUNTIME DESTINATION bin)
endmacro()

macro(configure_target name src_folder)
  aux_source_directory(${src_folder} JPEG_SRC)

  include_directories(${src_folder} ${TURBOJPEG_INC_DIR})
  link_directories(${TURBOJPEG_LIB_DIR})

  add_executable(${name} ${JPEG_SRC})
  target_link_libraries(${name} ${TURBOJPEG_LIB_LINKS} ${TARGET_LINK_OPTIONS})

  install(TARGETS ${name} RUNTIME DESTINATION bin)

  if(PLATFORM STREQUAL "x86")
    add_test(
      NAME test_${name}_640x360
      COMMAND $<TARGET_FILE:${name}> "${CMAKE_SOURCE_DIR}/res/main_t3.jpg"
              "${CMAKE_BINARY_DIR}/out_640.jpg" "640" "360")
  endif()
endmacro()
