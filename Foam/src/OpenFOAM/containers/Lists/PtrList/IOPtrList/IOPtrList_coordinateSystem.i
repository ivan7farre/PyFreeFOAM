//  pythonFlu - Python wrapping for OpenFOAM C++ API
//  Copyright (C) 2010- Alexey Petrov
//  Copyright (C) 2009-2010 Pebble Bed Modular Reactor (Pty) Limited (PBMR)
//  
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//  See http://sourceforge.net/projects/pythonflu
//
//  Author : Alexey PETROV


//---------------------------------------------------------------------------
#ifndef IOPtrList_coordinateSystem_i
#define IOPtrList_coordinateSystem_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.IOPtrList.IOPtrList_coordinateSystem";
%{
  #include "Foam/src/OpenFOAM/containers/Lists/PtrList/IOPtrList/IOPtrList_coordinateSystem.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/meshTools/coordinateSystems/coordinateSystem.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/IOPtrList/IOPtrList.hxx"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_coordinateSystem.i"

#if FOAM_VERSION( <, 010500 )
  %ignore Foam::IOPtrList< Foam::coordinateSystem >::debug;
  %ignore Foam::IOPtrList< Foam::coordinateSystem >::typeName;
  %ignore Foam::IOPtrList< Foam::coordinateSystem >::type;
#endif

%template( IOPtrList_coordinateSystem ) Foam::IOPtrList< Foam::coordinateSystem >;

%include "Foam/src/OpenFOAM/containers/Lists/PtrList/IOPtrList/IOPtrList_coordinateSystem.hh"


//---------------------------------------------------------------------------
#endif
