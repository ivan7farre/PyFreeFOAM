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
#ifndef PtrList_vectorField_i
#define PtrList_vectorField_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.PtrList_vectorField";
%{
   #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_vectorField.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"

%import "Foam/src/OpenFOAM/fields/tmp/autoPtr_vectorField.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"

%ignore Foam::PtrList< Foam::vectorField >::PtrList;
%ignore Foam::PtrList< Foam::vectorField >::set;

%template( PtrList_vectorField ) Foam::PtrList< Foam::vectorField >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::vectorField >
{
  Foam::PtrList< Foam::vectorField >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::vectorField >( s );
  }
}

%extend Foam::PtrList< Foam::vectorField > PTRLISTBASED_ADDONS( Foam::vectorField )


//---------------------------------------------------------------------------
#endif
