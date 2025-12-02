vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF 48ac5a1ea3b38a75d40b6165a8d3df2180a21496
    SHA512 be6598dac5c44f4e9b1c2ef0b7ef6cb56ba9aaf1c251b13170c4390d7fb879682c40a98c73ef33601a2c13b681d162de7055590e9aa798cb3a0130e4bc809dbe
    HEAD_REF temp
    AUTHORIZATION_TOKEN "$ENV{GITHUB_TOKEN}"
    USE_TARBALL_API
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DHIJOY_INSTALL=false
        -DHIJOY_OS_TYPE="gnulinux"
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
