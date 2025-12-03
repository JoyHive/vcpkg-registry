vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF temp
    SHA512 9d5fb001cbdaf62789f0584ab39a7f5ea2e6c36787dcdc42a8083110677b03aef31fa652d8787a0e756b8330439bc40166fd464bfc359c4ff6a6c804aab82a9f
    HEAD_REF temp
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
    USE_TARBALL_API
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
