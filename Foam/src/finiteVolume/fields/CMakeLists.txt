cmake_minimum_required(VERSION 2.8.0)
project (pyFluFreeFOAM)

add_subdirectory (fvPatchFields)
add_subdirectory (fvsPatchFields)

#only cpp files
#add_subdirectory (surfaceFields)
#add_subdirectory (volFields)

