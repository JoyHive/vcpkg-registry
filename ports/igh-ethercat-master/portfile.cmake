vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/igh-ethercat-master
    REF main
    SHA512 b15a4bf8c7238dbea67eb23dd3d5e5078b385ebf7264ec9281a924f323907c9b0e75c1bbc4c646e6c978b6178aa0906d0603d396c1a1916876167f7309a5234a
    HEAD_REF main
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
    USE_TARBALL_API
)

file(
    INSTALL "${SOURCE_PATH}/include/"
    DESTINATION "${CURRENT_PACKAGES_DIR}/include"
)

file(
    INSTALL "${SOURCE_PATH}/lib/"
    DESTINATION "${CURRENT_PACKAGES_DIR}/lib"
)

file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/igh-ethercat-masterConfig.cmake" "
include(CMakeFindDependencyMacro)

add_library(igh-ethercat-master::ethercat STATIC IMPORTED)
set_target_properties(igh-ethercat-master::ethercat PROPERTIES
    IMPORTED_LOCATION \"\${CMAKE_CURRENT_LIST_DIR}/../../lib/libethercat.a\"
    INTERFACE_INCLUDE_DIRECTORIES \"\${CMAKE_CURRENT_LIST_DIR}/../../include\"
)
")
