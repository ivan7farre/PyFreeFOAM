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
#ifndef PtrList_fvPatchField_scalar_cpp
#define PtrList_fvPatchField_scalar_cpp


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.PtrList_fvPatchField_scalar";
%{
   #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_fvPatchField_scalar.hh"
%}


//---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fields/fvPatchFields/fvPatchField_scalar.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/tmp_fvPatchField_scalar.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/autoPtr_fvPatchField_scalar.cpp"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"


//---------------------------------------------------------------------------
%ignore Foam::PtrList< Foam::fvPatchField< Foam::scalar > >::PtrList;
%ignore Foam::PtrList< Foam::fvPatchField< Foam::scalar > >::begin;
%ignore Foam::PtrList< Foam::fvPatchField< Foam::scalar > >::end;

%template( PtrList_fvPatchField_scalar ) Foam::PtrList< Foam::fvPatchField< Foam::scalar > >;

%template( TPtrContainer_iterator_PtrList_fvPatchField_scalar ) Foam::TPtrContainer_iterator< Foam::PtrList< Foam::fvPatchField< Foam::scalar > > >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::fvPatchField< Foam::scalar > >
{
  Foam::PtrList< Foam::fvPatchField< Foam::scalar > >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::fvPatchField< Foam::scalar > >( s );
  }
  
  Foam::TPtrContainer_iterator< Foam::PtrList< Foam::fvPatchField< Foam::scalar > > >* __iter__()
  {
    return new Foam::TPtrContainer_iterator< Foam::PtrList< Foam::fvPatchField< Foam::scalar > > >( *self );
  }
  
}

%extend Foam::PtrList< Foam::fvPatchField< Foam::scalar > > PTRLISTBASED_ADDONS( Foam::fvPatchField< Foam::scalar > )


//---------------------------------------------------------------------------
#endif
