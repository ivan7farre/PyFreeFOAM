cmake_minimum_required(VERSION 2.8.0)
project (pyFluFreeFOAM)

#Reset variables
##########################################################################
SET(INTERFACE)
SET(INTERFACE_FILE)
SET(MODULE_NAME)
##########################################################################

#Touch all interface files
##########################################################################
FILE(GLOB INTERFACE *.i)
##########################################################################

#Get all files from directory
##########################################################################
FOREACH(item ${INTERFACE})
  STRING(REPLACE "${CMAKE_CURRENT_SOURCE_DIR}/" "" item ${item})
  IF(item)
    LIST(APPEND INTERFACE_FILE ${item})
  ENDIF(item)
ENDFOREACH(item ${INTERFACE})
##########################################################################

#Replace INTERFACE variable to obtain module name
##########################################################################
FOREACH(item ${INTERFACE_FILE})
  STRING(REPLACE ".i" "" NAME ${item})
  IF(NAME)
    LIST(APPEND MODULE_NAME ${NAME})
    #Give values to obtain python modules

    pyfoam_add_module(${NAME})
#    message("Module name: ${MODULE_NAME}")
#    message("item: ${item}")
#    message("--------------------")
  ENDIF(NAME)

ENDFOREACH(item ${INTERFACE_FILE})
##########################################################################


add_subdirectory (OpenFOAM)
add_subdirectory (finiteVolume)
add_subdirectory (meshTools)
add_subdirectory (randomProcesses)
add_subdirectory (sampling)
add_subdirectory (transportModels)
add_subdirectory (turbulenceModels)

#Only cpp files
#add_subdirectory (thermophysicalModels)
