# Based on tinygltf at vcpkg baseline 84bab45d415d22042bd0b9081aea57f362da3f35.
# The v2.9.7 archive no longer matches that baseline's hash. SHA512 below was
# verified against the official GitHub archive on 2026-09-23.
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO syoyo/tinygltf
    REF "v${VERSION}"
    SHA512 553c7ad329da5a4d46235747db9d937957d5698e74c8d1751c17da5a1d09d35f4212e2476652a63ee1a12ff74220531b5e288eaaddb1014d47000a82d30f03a2
    HEAD_REF master
)

# Use the nlohmann-json dependency instead of the bundled header.
vcpkg_replace_string("${SOURCE_PATH}/tiny_gltf.h" "#include \"json.hpp\"" "#include <nlohmann/json.hpp>")
file(INSTALL "${SOURCE_PATH}/tiny_gltf.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
