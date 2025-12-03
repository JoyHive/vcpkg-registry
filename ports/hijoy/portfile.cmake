vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO JoyHive/HiJoy
    REF temp
    SHA512 daf43bac63358d2738dae43b6318f48b525242c9849fd93e1b1e1a4f3aac4e9b591979da14b530dada6961e2b985f4b4950e921a0272c13906d853aa8d4f5109
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
