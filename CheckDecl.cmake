if(__CHECK_DECL)
  return()
endif()
set(__CHECK_DECL 1)

include(CheckSymbolExists)

include(WriteToConfigHeader)

macro(check_decl decl)
  string(MAKE_C_IDENTIFIER "${decl}" _var)
  string(TOUPPER "${_var}" _var)
  if(NOT DEFINED _have_symbol_${_var})
    check_symbol_exists(${decl} "${ARGN}" _have_symbol_${_var})
    if(_have_symbol_${_var})
      set(HAVE_DECL_${_var} 1)
    else()
      set(HAVE_DECL_${_var} 0)
    endif()
    write_to_config_header(
      "#define HAVE_DECL_${_var} ${HAVE_DECL_${_var}}")
  endif()
endmacro()
