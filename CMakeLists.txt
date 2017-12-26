cmake_minimum_required(VERSION 3.3)
project(autoutils VERSION 0.2.0)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")

####
# Installation (https://github.com/forexample/package-example)

set(config_install_dir "lib/cmake/${PROJECT_NAME}")
set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(version_config "${generated_dir}/${PROJECT_NAME}ConfigVersion.cmake")
set(project_config "${generated_dir}/${PROJECT_NAME}Config.cmake")
set(namespace "${PROJECT_NAME}::")

include(CMakePackageConfigHelpers)

# Note: PROJECT_VERSION is used as a VERSION
write_basic_package_version_file(
    "${version_config}" COMPATIBILITY SameMajorVersion
)

# Use variables:
#   * TARGETS_EXPORT_NAME
#   * PROJECT_NAME
configure_package_config_file(
    "cmake/Config.cmake.in"
    "${project_config}"
    INSTALL_DESTINATION "${config_install_dir}"
)

install(
    FILES "${project_config}" "${version_config}"
    DESTINATION "${config_install_dir}"
)

install(
    FILES
    cmake/AutoutilsCheckDecl.cmake
    cmake/AutoutilsCheckFunc.cmake
    cmake/AutoutilsCheckHeader.cmake
    cmake/AutoutilsCheckLib.cmake
    cmake/AutoutilsCheckType.cmake
    cmake/AutoutilsIncludesDefault.cmake
    cmake/AutoutilsWriteToConfigHeader.cmake
    DESTINATION cmake/${PROJECT_NAME}
)
