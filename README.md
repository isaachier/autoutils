# Autoutils

A collection of utility scripts to imitate autotools in CMake. Many of the
macros provided by this library write to a `config.h` file in
`${CMAKE_CURRENT_BINARY_DIR}`. This mimics the autoconf generation of a config
header.

## CheckDecl

The `check_decl` macro uses the [CheckSymbolExists](https://cmake.org/cmake/help/v3.0/module/CheckSymbolExists.html)
module to determine if a given declaration exists. Optionally, a list of headers
to include may be given as a second argument to this macro. If the declaration
exists, set `HAVE_DECL_X` to `1` and write `#define HAVE_DECL_X 1` to
`config.h`. Otherwise, set `HAVE_DECL_X` to `0` and write
`#define HAVE_DECL_X 0` to `config.h`.

## CheckFunc

The `check_func` macro uses the [CheckFunctionExists](https://cmake.org/cmake/help/v3.0/module/CheckFunctionExists.html)
module to determine if a given function exists. If the function exists, set
`HAVE_X` to `ON` and write `#define HAVE_X` to `config.h`. Otherwise, write
`/* #undef HAVE_X */` to `config.h`.

## CheckHeader

The `check_header` macro uses the [CheckIncludeFile](https://cmake.org/cmake/help/v3.0/module/CheckIncludeFile.html)
module to determine if a given header exists. If the header exists, set `HAVE_X`
to `ON` and write `#define HAVE_X` to `config.h`. Otherwise, write
`/* #undef HAVE_X */` to `config.h`.

## CheckLib

The `check_lib` macro uses the [CheckLibraryExists](https://cmake.org/cmake/help/v3.0/module/CheckLibraryExists.html)
module to determine if a given library exists. The arguments should be the
library name followed by a function provided by the library. If the library
exists, set `HAVE_LIBX` to `ON` and write `#define HAVE_LIBX` to `config.h`.
Otherwise, write `/* #undef HAVE_LIBX */` to `config.h`.

## CheckType

The `check_type` macro uses the [CheckTypeSize](https://cmake.org/cmake/help/v3.0/module/CheckTypeSize.html)
module to determine if a given type can be found. Optionally, a list of headers
to include may be given as a second argument to this macro. If the declaration
exists, set `HAVE_X` to `ON` and write `#define HAVE_X` to `config.h`.
Otherwise, write `/* #define HAVE_X */` to `config.h`.

## IncludesDefault

Checks for a number of headers using the `check_header` macro. If a header
exists, it is appended to the `includes_default` variable. This variable
contains a list of reasonable default include files for testing macros, symbols,
etc. See autoconf's [Default Includes](https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Default-Includes.html#Default-Includes)
for details.

## WriteToConfigHeader

`write_to_config_header` appends a given line to `config.h` in
`${CMAKE_CURRENT_BINARY_DIR}`.
