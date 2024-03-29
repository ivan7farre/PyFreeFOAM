## pythonFlu - Python wrapping for OpenFOAM C++ API
## Copyright (C) 2010- Alexey Petrov
## Copyright (C) 2009-2010 Pebble Bed Modular Reactor (Pty) Limited (PBMR)
## 
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
## 
## See http://sourceforge.net/projects/pythonflu
##
## Author : Alexey PETROV
##


#--------------------------------------------------------------------------------------
# These lines will allow to share the type information between different dynamic librararies
import sys, DLFCN
sys.setdlopenflags( DLFCN.RTLD_NOW | DLFCN.RTLD_GLOBAL )


#---------------------------------------------------------------------------
def get_module_initializtion_command( the_module_name ) :
    import os
    if "@USE_SINGLE_LIB@" == "yes" :
        return "from Foam.pyfoam import *"

    return "from %s import *" % the_module_name


#-------------------------------------------------------------------------------
def get_proper_function( module_path, function_name ):
    list_versions = ["010701","010700","010600","010500","010401_dev"]
    for vers in list_versions:
        try:
            fun_name = function_name + "_" + vers
            an_expr = "from %s import %s as fun" %( module_path, fun_name )
            exec( an_expr )
            return fun
        except ImportError:
            if vers == "010401_dev":
               raise ImportError
               pass
            else:
               pass
                            

#--------------------------------------------------------------------------------
def FOAM_VERSION( Cmp, Version):

    return eval( "010701" + Cmp + Version )


#--------------------------------------------------------------------------------
def FOAM_REF_VERSION( Cmp, Version):

    return eval( "010701" + Cmp + Version ) and "x" == "x"


#----------------------------------------------------------------------------
def FOAM_BRANCH_VERSION( Name, Cmp, Version):

    return eval( "010701" + Cmp + Version ) and "x" == ( Name + "x" )
