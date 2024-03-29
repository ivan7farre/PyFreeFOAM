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
#ifndef PtrList_fvPatchField_vector_cpp
#define PtrList_fvPatchField_vector_cpp


//---------------------------------------------------------------------------
%{
   #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_fvPatchField_vector.hh"
%}


//---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fields/fvPatchFields/fvPatchField_vector.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/tmp_fvPatchField_vector.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/autoPtr_fvPatchField_vector.cpp"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"


//---------------------------------------------------------------------------
%ignore Foam::PtrList< Foam::fvPatchField< Foam::vector > >::PtrList;

%template( PtrList_fvPatchField_vector ) Foam::PtrList< Foam::fvPatchField< Foam::vector > >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::fvPatchField< Foam::vector > >
{
  Foam::PtrList< Foam::fvPatchField< Foam::vector > >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::fvPatchField< Foam::vector > >( s );
  }
}

%extend Foam::PtrList< Foam::fvPatchField< Foam::vector > > PTRLISTBASED_ADDONS( Foam::fvPatchField< Foam::vector > )


//---------------------------------------------------------------------------
#endif
    
