if(__autoutils_write_to_config_header)
  return()
endif()
set(__autoutils_write_to_config_header 1)

macro(autoutils_write_to_config_header line)
  if(NOT DEFINED autoutils_config_path)
    set(autoutils_config_path "${CMAKE_CURRENT_BINARY_DIR}/config.h"
        CACHE FILEPATH "Path to generated config header")
  endif()
  file(APPEND ${autoutils_config_path} "${line}\n")
endmacro()
