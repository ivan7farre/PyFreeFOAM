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
#ifndef DimensionedField_cpp
#define DimensionedField_cpp


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.fields.DimensionedFields.DimensionedField";
%{
  #include "Foam/src/OpenFOAM/fields/DimensionedFields/DimensionedField.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/regIOobject.i"

%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedType.i"

%include <DimensionedField.H>


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/tmp.i"

%define DIMENSIONED_FIELD_VIRTUAL_EXTENDS( Type, TMesh )
{
  void ext_assign( const Foam::DimensionedField< Foam::Type, Foam::TMesh >& theSource )
  {
    *dynamic_cast< Foam::DimensionedField< Foam::Type, Foam::TMesh >* >( self ) = theSource;
  }
}
%enddef


//---------------------------------------------------------------------------
%define NO_TMP_TYPEMAP_DIMENSIONED_FIELD( Type, TMesh, TPatchField )

%typecheck( SWIG_TYPECHECK_POINTER ) const Foam::DimensionedField< Type, TMesh >& 
{
  void *ptr;
  int res = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::DimensionedField< Type, TMesh > * ), 0 );
  int res1 = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::tmp< Foam::DimensionedField< Type, TMesh > > * ), 0 );
  int res2 = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::tmp< Foam::GeometricField< Type, TPatchField, TMesh > > * ), 0 );
  $1 = SWIG_CheckState( res ) || SWIG_CheckState( res1 ) || SWIG_CheckState( res2 );
}

%typemap( in ) const Foam::DimensionedField< Type, TMesh >& 
{
  void  *argp = 0;
  int res = 0;
  
  res = SWIG_ConvertPtr( $input, &argp, $descriptor(  Foam::DimensionedField< Type, TMesh > * ), %convertptr_flags );
  if ( SWIG_IsOK( res )&& argp  ){
    Foam::DimensionedField< Type, TMesh > * res = %reinterpret_cast( argp, Foam::DimensionedField< Type, TMesh >* );
    $1 = res;
  } else {
      res = SWIG_ConvertPtr( $input, &argp, $descriptor( Foam::tmp< Foam::DimensionedField< Type, TMesh > >* ), %convertptr_flags );
      if ( SWIG_IsOK( res ) && argp ) {
        Foam::tmp<Foam::DimensionedField< Type, TMesh > >* tmp_res = %reinterpret_cast( argp, Foam::tmp< Foam::DimensionedField< Type, TMesh > > * );
        $1 = tmp_res->operator->();
      } else {
          res = SWIG_ConvertPtr( $input, &argp, $descriptor( Foam::tmp< Foam::GeometricField< Type, TPatchField, TMesh > >* ), %convertptr_flags );
          if ( SWIG_IsOK( res ) && argp ) {
            Foam::tmp< Foam::GeometricField< Type, TPatchField, TMesh > >* tmp_res = %reinterpret_cast( argp, Foam::tmp< Foam::GeometricField< Type, TPatchField, TMesh > > * );
            $1 = tmp_res->operator->();
          } else {    
              %argument_fail( res, "$type", $symname, $argnum );
            }
      }
  }
}    
%enddef


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/objectRegistry.i"

%define DIMENSIONED_FIELD_TEMPLATE_FUNC( Type, TMesh )

%extend Foam::DimensionedField< Foam::Type, Foam::TMesh > COMMON_EXTENDS;

%extend Foam::DimensionedField< Foam::Type, Foam::TMesh > FIELD_VIRTUAL_EXTENDS( Type );

%extend Foam::DimensionedField< Foam::Type, Foam::TMesh > DIMENSIONED_FIELD_VIRTUAL_EXTENDS( Type, TMesh );

%extend Foam::DimensionedField< Foam::Type, Foam::TMesh > 
{
  OBJECTREGISTRY_TEMPLATE_2_EXTENDS( DimensionedField, Foam::Type, Foam::TMesh  )
    
  void ext_assign( const Foam::DimensionedField< Foam::Type, Foam::TMesh >& theArg )
  {
    *self = theArg;
  }
  
  Foam::dimensioned< Type > ext_sum()
  {
    return Foam::sum( *self );
  }
  
  ISINSTANCE_TEMPLATE_2_EXTEND( DimensionedField, Foam::Type, Foam::TMesh )
}

%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Ostream.i"

%extend Foam::DimensionedField< Foam::Type, Foam::TMesh > OSTREAM_EXTENDS;

%enddef


//--------------------------------------------------------------------------------
%define __VECTOR_DIMENSIONED_FIELD_OPERATORS( TMesh )
{
  Foam::tmp< Foam::DimensionedField< Foam::vector, TMesh > > __div__( const Foam::DimensionedField< Foam::scalar, TMesh >& theArg )
  {
    return *self / theArg;
  }
}
%enddef


//---------------------------------------------------------------------------------
%define VECTOR_DIMENSIONED_FIELD_TEMPLATE_FUNC( TMesh )
   DIMENSIONED_FIELD_TEMPLATE_FUNC( vector, TMesh );
   
   %extend Foam::DimensionedField< Foam::vector, Foam::TMesh > __VECTOR_DIMENSIONED_FIELD_OPERATORS( TMesh );
%enddef


//---------------------------------------------------------------------------------
%define DIMENSIONED_FIELD_VOLMESH_TYPEMAP( Type )

NO_TMP_TYPEMAP_DIMENSIONED_FIELD( Foam::Type, Foam::volMesh, Foam::fvPatchField );

%enddef


//---------------------------------------------------------------------------------
%define DIMENSIONED_FIELD_SURFACEMESH_TYPEMAP( Type )

NO_TMP_TYPEMAP_DIMENSIONED_FIELD( Foam::Type, Foam::surfaceMesh, Foam::fvsPatchField );

%enddef


//---------------------------------------------------------------------------------
#endif
