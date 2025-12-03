vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF temp
    SHA512 b340532b250a03fec07f1737e1567128e6039ee26b81b950ab4a54110cd9a4823d9c37790c6fa130e204c27585734d2e6483c7cab3d0dffd32f54bed625782d7
    HEAD_REF temp
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
    USE_TARBALL_API
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHIJOY_INSTALL=ON
        -DHIJOY_OS_TYPE="gnulinux"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/hijoy)

vcpkg_fixup_pkgconfig()

vcpkg_copy_pdbs()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
