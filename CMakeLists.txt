cmake_minimum_required(VERSION 3.23)

set(DEV_NAME StarletDev)
project(${DEV_NAME} LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)
set(EXTERN_DIR "${CMAKE_SOURCE_DIR}/Starlet")
set(BUILD_LOCAL OFF CACHE BOOL "Flag if Starlet files are already locally fetched")
set(TEST_REPO StarletSamples CACHE STRING "Test repo to be built")

if(NOT EXISTS "${EXTERN_DIR}/${TEST_REPO}/CMakeLists.txt")
    message(FATAL_ERROR "Selected test repo '${TEST_REPO}' not found under ${EXTERN_DIR}")
endif()

set(modules
  StarletMath
  StarletLogger
  StarletControls
  StarletScene
  StarletGraphics
  StarletSerializer
  StarletEngine
  ${TEST_REPO}
)

foreach (mod IN LISTS modules)
  set(mod_dir "${EXTERN_DIR}/${mod}")
  if(EXISTS "${mod_dir}/CMakeLists.txt")
    add_subdirectory(${mod_dir} ${mod})
  else()
    message(WARNING "Module ${mod} not found at ${mod_dir} or is missing its CMakeLists.txt")
  endif()
endforeach()

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "External")
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${TEST_REPO})
