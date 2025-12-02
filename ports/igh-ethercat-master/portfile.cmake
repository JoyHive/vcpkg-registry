vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/igh-ethercat-master
    REF main
    SHA512 0
)

file(
    INSTALL "${SOURCE_PATH}/include"
    DESTINATION "${CURRENT_PACKAGES_DIR}/include"
)

file(
    INSTALL "${SOURCE_PATH}/lib"
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
