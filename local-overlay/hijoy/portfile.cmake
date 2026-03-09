vcpkg_cmake_configure(
    SOURCE_PATH "$ENV{HIJOY_SOURCE_PATH}"
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
vcpkg_install_copyright(FILE_LIST "$ENV{HIJOY_SOURCE_PATH}/LICENSE")
