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
  STRING(REPLACE ".i" "" item ${item})
  IF(item)
    LIST(APPEND MODULE_NAME ${item})
    #Give values to obtain python modules
    pyfoam_add_module(${item})
#    message("Module name: ${MODULE_NAME}")
#    message("item: ${item}")
#    message("--------------------")
  ENDIF(item)

ENDFOREACH(item ${INTERFACE_FILE})
##########################################################################

#message ("${MODULE_NAME}")
#message ("${INTERFACE_FILE}")
#message ("${HEADER}")
