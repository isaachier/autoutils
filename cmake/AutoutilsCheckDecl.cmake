if(__autoutils_check_decl)
  return()
endif()
set(__autoutils_check_decl 1)

include(CheckSymbolExists)

include(AutoutilsWriteToConfigHeader)

macro(autoutils_check_decl decl)
  string(MAKE_C_IDENTIFIER "${decl}" _var)
  string(TOUPPER "${_var}" _var)
  if(NOT DEFINED _have_symbol_${_var})
    check_symbol_exists(${decl} "${ARGN}" _have_symbol_${_var})
    if(_have_symbol_${_var})
      set(HAVE_DECL_${_var} 1)
    else()
      set(HAVE_DECL_${_var} 0)
    endif()
    autoutils_write_to_config_header(
      "#define HAVE_DECL_${_var} ${HAVE_DECL_${_var}}")
  endif()
endmacro()
