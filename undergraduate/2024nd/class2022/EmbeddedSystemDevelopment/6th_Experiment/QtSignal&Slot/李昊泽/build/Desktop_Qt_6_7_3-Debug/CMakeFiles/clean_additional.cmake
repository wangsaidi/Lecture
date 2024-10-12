# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "ButtonCounter_autogen"
  "CMakeFiles/ButtonCounter_autogen.dir/AutogenUsed.txt"
  "CMakeFiles/ButtonCounter_autogen.dir/ParseCache.txt"
  )
endif()
