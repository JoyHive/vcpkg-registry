vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF temp
    SHA512 0
    HEAD_REF temp
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHIJOY_INSTALL=ON
        -DHIJOY_OS_TYPE="gnulinux"
        -DBUILD_SHARED_LIBS=ON
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/hijoy)
vcpkg_fixup_pkgconfig()
vcpkg_copy_pdbs()

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
