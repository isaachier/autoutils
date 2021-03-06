if(__autoutils_check_header)
  return()
endif()
set(__autoutils_check_header 1)

include(CheckIncludeFile)

include(AutoutilsWriteToConfigHeader)

macro(autoutils_check_header header)
  string(MAKE_C_IDENTIFIER "${header}" _var)
  string(TOUPPER "${_var}" _var)
  check_include_file(${header} _have_include_${_var})

  if(_have_include_${_var})
    set(HAVE_${_var} ON)
    autoutils_write_to_config_header("#define HAVE_${_var}")
  else()
    autoutils_write_to_config_header("/* #undef HAVE_${_var} */")
  endif()
endmacro()
