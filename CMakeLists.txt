cmake_minimum_required(VERSION 3.0)
project(autoutils VERSION 0.1.0)

include(CMakePackageConfigHelpers)
configure_package_config_file(
  autoutils-config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/autoutils-config.cmake
  INSTALL_DESTINATION share/autoutils)

install(DIRECTORY cmake DESTINATION share/autoutils)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/autoutils-config.cmake
        DESTINATION share/autoutils)
