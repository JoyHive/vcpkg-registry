vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/igh-ethercat-master
    REF main
    SHA512 f27591ed1debba3af89047967a22083f341ecd14e72e99fab5940756c71f6126e5e54cdcad6d226bd8a5bb54f613d703615ba7fa49899a04f0a168a5fb8c1bdf
    HEAD_REF main
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
    USE_TARBALL_API
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
