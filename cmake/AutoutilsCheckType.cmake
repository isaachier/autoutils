if(__autoutils_check_type)
  return()
endif()
set(__autoutils_check_type 1)

include(CheckTypeSize)

include(AutoutilsWriteToConfigHeader)

macro(autoutils_check_type type)
  string(MAKE_C_IDENTIFIER "${type}" _var)
  string(TOUPPER "${_var}" _var)
  if(NOT DEFINED _test_${_var})
    if(ARGN)
      set(CMAKE_REQUIRED_INCLUDES ${ARGN})
    endif()
    check_type_size(${type} _test_${_var})
    if(_test_${_var})
      set(HAVE_${_var} ON)
      autoutils_write_to_config_header("#define HAVE_${_var}")
    else()
      autoutils_write_to_config_header("/* #undef HAVE_${_var} */")
    endif()
  endif()
endmacro()
