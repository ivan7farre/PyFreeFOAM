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
#ifndef fvMatrix_cpp
#define fvMatrix_cpp


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.fvMatrices.fvMatrix";
%{
  #include "Foam/src/finiteVolume/fvMatrices/fvMatrix.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/refCount.i"

%import "Foam/src/OpenFOAM/matrices/lduMatrix/lduMatrix.i"

%import "Foam/src/OpenFOAM/db/typeInfo/className.hxx"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/OpenFOAM/fields/tmp/tmp.i"

%import "Foam/src/finiteVolume/fvMatrices/fvMatricesFwd.hpp"

%include <fvMatrix.H>


//---------------------------------------------------------------------------
%define NO_TMP_TYPEMAP_FVMATRIX( Type )

%typecheck( SWIG_TYPECHECK_POINTER ) Foam::fvMatrix< Type >& 
{
  void *ptr;
  int res = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::fvMatrix< Type > * ), 0 );
  int res1 = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::tmp< Foam::fvMatrix< Type > > * ), 0 );
  $1 = SWIG_CheckState( res ) || SWIG_CheckState( res1 );
}

%typemap( in ) Foam::fvMatrix< Type >& 
{
  void  *argp = 0;
  int res = 0;
  
  res = SWIG_ConvertPtr( $input, &argp, $descriptor(  Foam::fvMatrix< Type > * ), %convertptr_flags );
  if ( SWIG_IsOK( res )&& argp  ){
    Foam::fvMatrix< Type > * res = %reinterpret_cast( argp, Foam::fvMatrix< Type >* );
    $1 = res;
  } else {
    res = SWIG_ConvertPtr( $input, &argp, $descriptor( Foam::tmp< Foam::fvMatrix< Type > >* ), %convertptr_flags );
    if ( SWIG_IsOK( res ) && argp ) {
      Foam::tmp< Foam::fvMatrix< Type > >* tmp_res = %reinterpret_cast( argp, Foam::tmp< Foam::fvMatrix< Type > > * );
      $1 = tmp_res->operator->();
    } else {
      %argument_fail( res, "$type", $symname, $argnum );
    }
  }
}    
%enddef

//---------------------------------------------------------------------------

%define __COMMON_FVMATRIX_TEMPLATE_FUNC__( Type )
{
  Foam::tmp< Foam::fvMatrix< Type > > __neg__() const
  {
    return -get_ref( self );
  }
  
  Foam::tmp< Foam::fvMatrix< Type > > __add__( const Foam::fvMatrix< Type >& theArg ) const
  {
    return get_ref( self ) + theArg;
  }
  
  Foam::tmp< Foam::fvMatrix< Type > > __add__( const Foam::dimensioned< Type >& theArg ) const
  {
    return get_ref( self ) + theArg;
  }

  Foam::tmp< Foam::fvMatrix< Type > > __sub__( const Foam::fvMatrix< Type >& theArg ) const
  {
    return get_ref( self ) - theArg;
  }

  Foam::tmp< Foam::fvMatrix< Type > > __add__( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return get_ref( self ) + theArg;
  }

  Foam::tmp< Foam::fvMatrix< Type > > __radd__( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return theArg + get_ref( self )  ;
  }

  Foam::tmp< Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh > > 
  __and__ ( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return get_ref( self ) & theArg;
  }
  
  Foam::tmp< Foam::fvMatrix< Type > > __sub__( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return get_ref( self ) - theArg;
  }

  Foam::tmp< Foam::fvMatrix< Type > > __rsub__( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return theArg - get_ref( self );
  }

  Foam::tmp< Foam::fvMatrix< Type > > __eq__( const Foam::fvMatrix< Type >& theArg ) const
  {
    return get_ref( self ) == theArg;
  }
  Foam::tmp< Foam::fvMatrix< Type > > __eq__( const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return get_ref( self ) == theArg;
  }
  
  Foam::tmp< Foam::fvMatrix< Type > > __eq__( const Foam::dimensioned< Type >& theArg ) const
  {
    return get_ref( self ) == theArg;
  }
}
%enddef


//---------------------------------------------------------------------------
%define FVMATRIX_TEMPLATE_GLOBAL_FUNC( Type )

%import "Foam/src/OpenFOAM/matrices/lduMatrix/lduMatrix.i"
%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Istream.i"

%inline
%{
  Foam::lduMatrix::solverPerformance solve( Foam::fvMatrix< Type >& fvm, Foam::Istream& solverControls )
  {
    return Foam::solve( fvm, solverControls );
  }
#if FOAM_VERSION( >=, 010600 )
  Foam::lduMatrix::solverPerformance solve( Foam::fvMatrix< Type >& fvm, Foam::dictionary& solverControls )
  {
    return Foam::solve( fvm, solverControls );
  }
#endif    
  Foam::lduMatrix::solverPerformance solve( Foam::fvMatrix< Type >& fvm )
  {
    return Foam::solve( fvm );
  }
%}

%inline
%{
  void checkMethod( const Foam::fvMatrix< Type >& fvm1, const Foam::fvMatrix< Type >& fvm2, const char* op )
  {
    return checkMethod< Type >( fvm1, fvm2, op );
  }

#if FOAM_VERSION( <, 010600 )
  void checkMethod( const Foam::fvMatrix< Type >& fvm, const Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& gf, const char* op )
  {
    return checkMethod< Type >( fvm, gf, op );
  }
#else
  void checkMethod( const Foam::fvMatrix< Type >& fvm, const Foam::DimensionedField< Type, Foam::volMesh >& df, const char* op )
  {
    return checkMethod< Type >( fvm, df, op );
  }
#endif

  void checkMethod( const Foam::fvMatrix< Type >& fvm, const Foam::dimensioned< Type >& dt, const char* op)
  {
    return checkMethod< Type >( fvm, dt, op );
  }
#if FOAM_VERSION( >=, 010600 )
  Foam::tmp< Foam::fvMatrix< Type > > correction(const Foam::fvMatrix< Type >& fvm)
  {
    return correction< Type >( fvm );
  }
#endif    
%}

%enddef


//---------------------------------------------------------------------------
%define FVMATRIX_TEMPLATE_FUNC( Type )

%import "Foam/src/OpenFOAM/fields/tmp/tmp.i"

NO_TMP_TYPEMAP_FVMATRIX( Type );

%extend Foam::fvMatrix< Type > COMMON_EXTENDS;

%extend Foam::tmp< Foam::fvMatrix< Type > > COMMON_EXTENDS;

%extend Foam::fvMatrix< Type > __COMMON_FVMATRIX_TEMPLATE_FUNC__( Type );

%extend Foam::tmp< Foam::fvMatrix< Type > > __COMMON_FVMATRIX_TEMPLATE_FUNC__( Type );

%enddef


//---------------------------------------------------------------------------
%define __SCALAR_FVMATRIX_TEMPLATE_OPERATORS
{
  Foam::tmp< Foam::fvMatrix< Foam::scalar > > __rmul__( const Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >& theArg ) const
  {
    return theArg * get_ref( self );
  }
}
%enddef


//---------------------------------------------------------------------------
%define SCALAR_FVMATRIX_TEMPLATE_FUNC

FVMATRIX_TEMPLATE_FUNC( Foam::scalar );

%extend Foam::fvMatrix< Foam::scalar > __SCALAR_FVMATRIX_TEMPLATE_OPERATORS;

%extend Foam::tmp< Foam::fvMatrix< Foam::scalar > > __SCALAR_FVMATRIX_TEMPLATE_OPERATORS;

%enddef


//----------------------------------------------------------------------------
#endif
