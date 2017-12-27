if(__autoutils_write_to_config_header)
  return()
endif()
set(__autoutils_write_to_config_header 1)

set(__autoutils_write_to_config_header_first_invocation ON)

macro(autoutils_write_to_config_header line)
  if(__autoutils_write_to_config_header_first_invocation)
    if(NOT autoutils_config_path)
      set(autoutils_config_path "${CMAKE_CURRENT_BINARY_DIR}/config.h"
          CACHE FILEPATH "Path to generated config header" FORCE)
    endif()

    if(EXISTS "${autoutils_config_path}")
      message(STATUS "Removing old config and regenerating")
      file(REMOVE "${autoutils_config_path}")
    endif()

    set(__autoutils_write_to_config_header_first_invocation OFF)
  endif()

  file(APPEND ${autoutils_config_path} "${line}\n")
endmacro()
