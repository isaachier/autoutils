if(__CHECK_HEADER)
  return()
endif()
set(__CHECK_HEADER 1)

include(CheckIncludeFile)

include(WriteToConfigHeader)

macro(check_header header)
  string(MAKE_C_IDENTIFIER "${header}" _var)
  string(TOUPPER "${_var}" _var)
  if(NOT DEFINED _have_include_${_var})
    check_include_file(${header} _have_include_${_var})
    if(_have_include_${_var})
      set(HAVE_${_var} ON)
      write_to_config_header("#define HAVE_${_var}")
    else()
      write_to_config_header("/* #undef HAVE_${_var} */")
    endif()
  endif()
endmacro()
