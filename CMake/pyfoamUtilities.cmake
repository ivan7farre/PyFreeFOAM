function(pyfoam_add_module modulename)

FIND_PACKAGE(PythonInterp)
FIND_PACKAGE(PythonLibs)
INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_DIR} ${CMAKE_CURRENT_SOURCE_DIR} ${COMMON_DIR})

SET(PYFOAM_LIBS ${PYFOAM_LIBRARY_DIRS}/libfiniteVolume.so ${PYFOAM_LIBRARY_DIRS}/libsampling.so ${PYFOAM_LIBRARY_DIRS}/libbasicThermophysicalModels.so ${PYFOAM_LIBRARY_DIRS}/libmeshTools.so ${PYFOAM_LIBRARY_DIRS}/libincompressibleLESModels.so ${PYFOAM_LIBRARY_DIRS}/libincompressibleRASModels.so ${PYFOAM_LIBRARY_DIRS}/libincompressibleTurbulenceModel.so ${PYFOAM_LIBRARY_DIRS}/libcompressibleLESModels.so ${PYFOAM_LIBRARY_DIRS}/libcompressibleRASModels.so ${PYFOAM_LIBRARY_DIRS}/libcompressibleTurbulenceModel.so ${PYFOAM_LIBRARY_DIRS}/libradiation.so ${PYFOAM_LIBRARY_DIRS}/libincompressibleTransportModels.so ${PYFOAM_LIBRARY_DIRS}/libinterfaceProperties.so ${PYFOAM_LIBRARY_DIRS}/libtwoPhaseInterfaceProperties.so ${PYFOAM_LIBRARY_DIRS}/libdynamicFvMesh.so ${PYFOAM_LIBRARY_DIRS}/libdynamicMesh.so ${PYFOAM_LIBRARY_DIRS}/librandomProcesses.so ${PYFOAM_LIBRARY_DIRS}/libspecie.so ${PYFOAM_LIBRARY_DIRS}/libOpenFOAM.so ${PYFOAM_LIBRARY_DIRS}/libtriSurface.so ${PYFOAM_LIBRARY_DIRS}/libsurfMesh.so ${PYFOAM_LIBRARY_DIRS}/libdecompositionMethods.so ${PYFOAM_LIBRARY_DIRS}/liblagrangian.so ${PYFOAM_LIBRARY_DIRS}/libLESdeltas.so ${PYFOAM_LIBRARY_DIRS}/libLESfilters.so ${PYFOAM_LIBRARY_DIRS}/libscotchDecomp.so ${PYFOAM_LIBRARY_DIRS}/plugins1/libmpiPstream.so)

SET (LIBRARIES ${PYTHON_LIBRARIES} ${PYFOAM_LIBS})
SET (SWIG_DIRECTORIES ${PYFOAM_INCLUDE_DIRS} -I/usr/include -I/usr/include/c++)
SET (FLAG "\"-I.\" \"-D DIRECTOR_INCLUDE=<${modulename}PYTHON_wrap.h>\"")

#General Options
# -c++   Enable C++ processing
# -MM    List dependencies, but omit files in SWIG librar
# -w508  Declaration of 'XXX' shadows declaration accessible via 'YYY"
# -w317  Specialization of non-template 'XXX'
# -w312  Nested class not currently supported (ignored)
# -w509  Overloaded method 'XXX' is shadowed by 'YYY'
# -w503  Can't wrap 'XXX' unless renamed to a valid identifier
# -w462  Unable to set dimensionless array variable
# -w473  Returning a pointer or reference in a director method is not recommended

SET (SWIG_PARAMETERS -c++ -MMD ${FOAM_DEFINITIONS} -D__restrict__  -DOpenFOAM_EXPORTS ${PYFOAM_FLAGS} -I${COMMON_DIR}/Foam/patches/r1.7.1-free -I${COMMON_DIR}/Foam/patches/r1.5-free ${SWIG_DIRECTORIES} -w508  -w317  -w312  -w509  -w503  -w462  -w473 -module ${modulename})

SET_SOURCE_FILES_PROPERTIES(${modulename}.i PROPERTIES CPLUSPLUS ON)
SET_SOURCE_FILES_PROPERTIES(${modulename}.i PROPERTIES LANGUAGE CXX)
SET_SOURCE_FILES_PROPERTIES(${modulename}.i PROPERTIES SWIG_FLAGS "${SWIG_PARAMETERS}")
SET_SOURCE_FILES_PROPERTIES(${modulename}PYTHON_wrap.cxx PROPERTIES COMPILE_FLAGS "${FLAG}")

SWIG_ADD_MODULE(${modulename} python ${modulename}.i ${modulename}.hh)
SWIG_LINK_LIBRARIES(${modulename} ${LIBRARIES})

endfunction()
