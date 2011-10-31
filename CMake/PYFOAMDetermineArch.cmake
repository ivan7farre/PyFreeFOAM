
# Do feature detection
# ~~~~~~~~~~~~~~~~~~~~

include(CheckCXXSourceCompiles)
include(CheckVariableExists)
include(CheckIncludeFile)
include(CheckFunctionExists)


# Do system detection
# ~~~~~~~~~~~~~~~~~~~
if(UNIX)
  execute_process(COMMAND uname -s OUTPUT_VARIABLE PYFOAM_OSNAME OUTPUT_STRIP_TRAILING_WHITESPACE)
  execute_process(COMMAND uname -m OUTPUT_VARIABLE PYFOAM_CPUNAME OUTPUT_STRIP_TRAILING_WHITESPACE)
else()
  message(FATAL_ERROR "${CMAKE_PROJECT_NAME} only runs under UNIX-like systems (Linux, Solaris, Mac OS X,...)")
endif()

#message ("PYFOAM_OSNAME = ${PYFOAM_OSNAME}")
#message ("PYFOAM_CPUNAME = ${PYFOAM_CPUNAME}")

# 64 bit possible?
set(PYFOAM_DEFAULT_64_BIT OFF)
if(PYFOAM_CPUNAME MATCHES ".*64" OR PYFOAM_OSNAME MATCHES ".*64")
  set(PYFOAM_DEFAULT_64_BIT ON)
  option(PYFOAM_64_BIT "Compile ${CMAKE_PROJECT_NAME} in 64 bit." ${PYFOAM_DEFAULT_64_BIT})
  mark_as_advanced(PYFOAM_64_BIT)
else()
  set(PYFOAM_64_BIT ${PYFOAM_DEFAULT_64_BIT})
endif()

# linux
#~~~~~~
if(PYFOAM_OSNAME STREQUAL Linux)
  if(PYFOAM_CPUNAME STREQUAL i686)
    set(PYFOAM_OS linux)
  elseif(PYFOAM_CPUNAME STREQUAL x86_64)
    if(PYFOAM_64_BIT)
      set(PYFOAM_OS linux64)
    else()
      set(PYFOAM_OS linux)
    endif()
  else()
    message(STATUS  Unknown processor type ${PYFOAM_CPUNAME} for Linux)
  endif()
  set(LINUX_LINK_OPTS)
  if(PYFOAM_OS STREQUAL linux)
    set(LINUX_COMPILE_OPTS -m32)
  elseif(PYFOAM_OS STREQUAL linux64)
    set(LINUX_COMPILE_OPTS -m64)
  endif()

#  set(CMAKE_C_FLAGS ${LINUX_COMPILE_OPTS} ${LINUX_LINK_OPTS} CACHE STRING
#    "Flags for C compiler.")
#  set(CMAKE_CXX_FLAGS ${LINUX_COMPILE_OPTS} ${LINUX_LINK_OPTS} CACHE STRING
#    "Flags used by the compiler during all build types.")
#  set(CMAKE_SHARED_LINKER_FLAGS ${LINUX_COMPILE_OPTS} ${LINUX_LINK_OPTS} CACHE STRING
#    "Flags used by the linker during the creation of shared libs.")

endif()

#message ("CMAKE_C_FLAGS = ${LINUX_COMPILE_OPTS} # ${LINUX_LINK_OPTS}")
#message ("CMAKE_CXX_FLAGS = ${LINUX_COMPILE_OPTS} # ${LINUX_LINK_OPTS}")
#message ("CMAKE_SHARED_LINKER_FLAGS = ${LINUX_COMPILE_OPTS} # ${LINUX_LINK_OPTS}")
#message ("PYFOAM_OS  = ${PYFOAM_OS}")

#message ("------------------------------------")
#message ("PYFOAM_OSNAME = ${PYFOAM_OSNAME}")
#message ("PYFOAM_CPUNAME = ${PYFOAM_CPUNAME}")

