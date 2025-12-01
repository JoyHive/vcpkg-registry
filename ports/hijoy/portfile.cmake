vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF a76f6010432789c3c7e0d78c45e66a1cd268cf85
    SHA512 47ff6d289dcc22681eea6da465b0348172921e7cafff8fd57a1540d3232cc6b53250a4625c954ee0944c87963b17680ecbc3ea123e43c2c822efe0dc6fa6cef3
    HEAD_REF main
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
