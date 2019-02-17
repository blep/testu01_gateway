cmake_minimum_required(VERSION 3.5)

PROJECT(TestU01Gateway)
include(CheckCSourceCompiles) 
INCLUDE(ExternalProject)

# Output all libraries and executables in the same directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin
    CACHE PATH "Single directory for all libraries.")
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin
    CACHE PATH "Single directory for all executables.")
mark_as_advanced( LIBRARY_OUTPUT_PATH EXECUTABLE_OUTPUT_PATH )


set(THIRDPARTIES_INSTALL_DIR ${CMAKE_BINARY_DIR}/thirdparties)

externalproject_add(
    testu01_prj
    GIT_REPOSITORY https://github.com/blep/TestU01.git
    GIT_TAG "v1.2.3"
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/thirdparties/TestU01
    CONFIGURE_COMMAND ./configure --prefix=${THIRDPARTIES_INSTALL_DIR} --disable-shared
    BUILD_COMMAND make install
    INSTALL_DIR ${THIRDPARTIES_INSTALL_DIR}
    BUILD_IN_SOURCE 1
)
set(THIRDPARTIES_LIB_DIR ${THIRDPARTIES_INSTALL_DIR}/lib)
set(TESTU01_LIBRARIES 
    ${THIRDPARTIES_LIB_DIR}/libtestu01.a 
    ${THIRDPARTIES_LIB_DIR}/libmylib.a 
    ${THIRDPARTIES_LIB_DIR}/libprobdist.a)

# Adds third-parties include/lib dir to look-up paths
include_directories(BEFORE ${THIRDPARTIES_INSTALL_DIR}/include)
link_directories(${THIRDPARTIES_INSTALL_DIR}/lib)
include_directories(thirdparties/pcg-c/include)


add_subdirectory( src/ )

