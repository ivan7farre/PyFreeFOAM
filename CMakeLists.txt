cmake_minimum_required(VERSION 2.8.0)
project (pyFluFreeFOAM)

# include utilities
include(${CMAKE_SOURCE_DIR}/CMake/pyfoamUtilities.cmake)
include(${CMAKE_SOURCE_DIR}/CMake/PYFOAMDetermineArch.cmake)
#set(FreeFOAM_DIR "/usr/local/share/freefoam/CMake")
#Define PROJECT_SOURCE_DIR
SET (COMMON_DIR ${PROJECT_SOURCE_DIR})

# Make sure that Python (developement version, with Python.h header file) is 
# installed (tested with 2.4, 2.6.2)
# Please follow instructions from http://www.python.org/ web-site.
# find python interpreter
# find_package(PythonInterp REQUIRED)
## From http://www.cmake.org/Wiki/CMake_FAQ
FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_DIR})

# Make sure that SWIG is installed (tested with 1.3.36 - 1.3.40 )
#  Please follow instructions from http://www.swig.org/ web-site.
# From http://www.cmake.org/Wiki/CMake_FAQ:
#FIND_PACKAGE(SWIG REQUIRED)
FIND_PACKAGE(SWIG 1.3.40 EXACT REQUIRED)
INCLUDE(${SWIG_USE_FILE})

#FreeFOAM enviroment
FIND_PACKAGE(FreeFOAM REQUIRED)
INCLUDE(${FOAM_USE_FILE})
#message ("FOAM_INCLUDE_DIRS: ${FOAM_INCLUDE_DIRS}")
#message ("FOAM_LIBRARY_DIRS: ${FOAM_LIBRARY_DIRS}")

SET (PYFOAM_INCLUDE_DIR ${FOAM_INCLUDE_DIRS} CACHE STRING "Foam Path." FORCE)
SET (PYFOAM_LIBRARY_DIRS ${FOAM_LIBRARY_DIRS} CACHE STRING "Foam Libs." FORCE)
SET (PYFOAM_BRANCH FREEFOAM CACHE STRING "Choose the type of Foam OpenSource distribution." FORCE)

## Gerber: FreeFOAM uses FOAM_UPSTREAM_VERSION_FULL, but is not public available. Contact Michael.
SET (PYFOAM_VERSION 010701 CACHE STRING "Choose the corresponding version of OpenFOAM used. Could be \"010701\",\"010700\",\"010600\",\"010500\"." FORCE)

SET (PYFOAM_FLAGS -D__FOAM_VERSION__=${PYFOAM_VERSION} -D__FOAM_BRANCH__=__${PYFOAM_BRANCH}__)
SET (PYFOAM_INCLUDE_DIRS -I${PYFOAM_INCLUDE_DIR}/finiteVolume -I${PYFOAM_INCLUDE_DIR}/sampling -I${PYFOAM_INCLUDE_DIR}/basicThermophysicalModels -I${PYFOAM_INCLUDE_DIR}/meshTools -I${PYFOAM_INCLUDE_DIR}/incompressibleLESModels -I${PYFOAM_INCLUDE_DIR}/incompressibleRASModels -I${PYFOAM_INCLUDE_DIR}/compressibleLESModels -I${PYFOAM_INCLUDE_DIR}/compressibleRASModels -I${PYFOAM_INCLUDE_DIR}/radiation -I${PYFOAM_INCLUDE_DIR}/incompressibleTransportModels -I${PYFOAM_INCLUDE_DIR}/interfaceProperties -I${PYFOAM_INCLUDE_DIR}/dynamicFvMesh -I${PYFOAM_INCLUDE_DIR}/dynamicMesh -I${PYFOAM_INCLUDE_DIR}/randomProcesses -I${PYFOAM_INCLUDE_DIR}/OpenFOAM -I${PYFOAM_INCLUDE_DIR}/OSspecific)
ADD_DEFINITIONS(${PYFOAM_FLAGS} ${PYFOAM_INCLUDE_DIRS})

foreach(f ${FOAM_DEFINITIONS})
    SET (SWIGGING_FLAGS ${SWIGGING_FLAGS} -D${f})
endforeach(f)


#Install on PYTHON_LIBRARIES - path to the python library for default
SET (CMAKE_INSTALL_PREFIX ${PYTHON_LIBRARIES}/dist-packages CACHE STRING "Default installation path." FORCE)

INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/Foam DESTINATION ${CMAKE_INSTALL_PREFIX}
        FILES_MATCHING PATTERN "*.so")
INSTALL (DIRECTORY ${CMAKE_BINARY_DIR}/Foam DESTINATION ${CMAKE_INSTALL_PREFIX}
        FILES_MATCHING PATTERN "*.py")

INSTALL (DIRECTORY "${PROJECT_SOURCE_DIR}/Foam" DESTINATION ${CMAKE_INSTALL_PREFIX}
        FILES_MATCHING PATTERN "*.py")

add_subdirectory (Foam)
