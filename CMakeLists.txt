cmake_minimum_required(VERSION 3.23)
 
# Config
set(DEV_NAME starlet_dev)
set(EXTERN_DIR "${CMAKE_SOURCE_DIR}/starlet" CACHE PATH "Directory containg starlet modules")
set(BUILD_LOCAL OFF CACHE BOOL "Flag if Starlet files are already locally fetched")
set(TEST_REPO "starlet-samples" CACHE STRING "Test repo to be built")

project(${DEV_NAME} LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 20)

# Verify test repo exists
if(NOT EXISTS "${EXTERN_DIR}/${TEST_REPO}/CMakeLists.txt")
    message(FATAL_ERROR "Selected test repo '${TEST_REPO}' not found under ${EXTERN_DIR}")
endif()

# Directory names
set(STARLET_MODULES
  starlet-math
  starlet-logger
  starlet-controls
  starlet-scene
  starlet-graphics
  starlet-serializer
  starlet-engine
  ${TEST_REPO}
)

# Add subdirectories
foreach (module IN LISTS STARLET_MODULES)
  set(module_dir "${EXTERN_DIR}/${module}")
  if(EXISTS "${module_dir}/CMakeLists.txt")
    add_subdirectory(${module_dir} ${module})
  else()
    message(WARNING "Module ${module} not found at ${module_dir} or is missing its CMakeLists.txt")
  endif()
endforeach()

# IDE organization
set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER "External")
string(REPLACE "-" "_" target ${TEST_REPO})
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${target})
