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
#ifndef fvPatchField_cpp
#define fvPatchField_cpp


//---------------------------------------------------------------------------
%module( directors="1", allprotected="1" ) "Foam.src.finiteVolume.fields.fvPatchFields.fvPatchField";
%{
  #include "Foam/src/finiteVolume/fields/fvPatchFields/fvPatchField.hh"
%}

%import "Foam/src/director.hxx"


//---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fvMesh/fvPatches/fvPatch.cpp"

%import "Foam/src/OpenFOAM/fields/tmp/tmp.i"

%feature( "director" ) fvPatchField;

%include <fvPatchField.H>
%include <fvPatchFieldsFwd.H>
%include <DimensionedField.H>


//---------------------------------------------------------------------------
%define FVPATCHFIELD_VIRTUAL_EXTENDS( Type )
{
  void ext_assign( const Foam::fvPatchField< Foam::Type >& theSource )
  {
    *dynamic_cast< Foam::fvPatchField< Foam::Type >* >( self ) = theSource;
  }
}
%enddef


//--------------------------------------------------------------------------
%define __COMMON_FVPATCHFIELD_TEMPLATE_FUNC_EXTENDS( Type )
{
  Foam::ext_tmp< Foam::Field< Type > > ext_snGrad()
  {
    return self->snGrad();
  }
}
%enddef


//---------------------------------------------------------------------------
%define FVPATCHFIELD_EXTENDS( Type )

%feature( "director" ) fvPatchField_##Type;

NO_TMP_TYPEMAP_FIELD( fvPatchField< Foam::scalar > );
NO_TMP_TYPEMAP_FIELD( fvPatchField< Foam::vector > );
NO_TMP_TYPEMAP_FIELD( fvPatchField< Foam::tensor > );

%extend Foam::fvPatchField< Foam::Type > FIELD_VIRTUAL_EXTENDS( Type );

%extend Foam::fvPatchField< Foam::Type > __COMMON_FVPATCHFIELD_TEMPLATE_FUNC_EXTENDS( Type );

%extend Foam::fvPatchField< Foam::Type > FVPATCHFIELD_VIRTUAL_EXTENDS( Type );

%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Ostream.i"

%extend Foam::fvPatchField< Foam::Type > OSTREAM_EXTENDS;

%enddef


//---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fields/fvPatchFields/fvPatchField_ConstructorToTable.hh"

%feature( "director" ) fvPatchFieldConstructorToTableBase;


//---------------------------------------------------------------------------
%define __FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC__( Type, counter )
  %feature("director") fvPatchFieldConstructorToTableBase_##Type##_##counter;
  %template( fvPatchFieldConstructorToTableBase_##Type##_##counter ) Foam::fvPatchFieldConstructorToTableBase< Foam::Type, counter >;
%enddef


//---------------------------------------------------------------------------
%define FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC( Type )
  %template( TConstructorToTableCounter_fvPatchField_##Type ) Foam::TConstructorToTableCounter< Foam::fvPatchField< Foam::Type > >;
  __FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC__( Type, 0 );
  __FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC__( Type, 1 );
  __FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC__( Type, 2 );
%enddef


//---------------------------------------------------------------------------
%define FVPATCHFIELD_ADDONS( Type )
  FVPATCHFIELD_EXTENDS( Type )
  FVPATCHFIELD_CONSTRUCTORTOTABLE_TEMPLATE_FUNC( Type )
%enddef


//---------------------------------------------------------------------------
#endif
