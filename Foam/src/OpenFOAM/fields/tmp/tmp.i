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
#ifndef tmp_i
#define tmp_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.fields.tmp.tmp";
%{
  #include "Foam/src/OpenFOAM/fields/tmp/tmp.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/refCount.i"

%import "Foam/src/OpenFOAM/db/typeInfo/typeInfo.hxx"

%import "Foam/src/OpenFOAM/fields/tmp/smartPtr_extend.hxx"

%import "Foam/ext/common/ext_tmp.hxx"

%include <tmp.H>


//---------------------------------------------------------------------------
%define TMP_DIRECTOR_TYPEMAP( Type )

%feature( "novaluewrapper" ) Foam::tmp< Type >;

%typemap( in ) const Foam::tmp< Type >& ( void  *argp = 0, int check = 0, Foam::tmp< Type > result ) 
{
  // First check the simplest case, complete coinsidence of the types
  check = SWIG_ConvertPtr( $input, &argp, $descriptor( Foam::tmp< Type > * ), %convertptr_flags );
  if ( SWIG_IsOK( check ) && argp ) {
    result = *%reinterpret_cast( argp, Foam::tmp< Type > * );
  } else {
    check = SWIG_ConvertPtr( $input, &argp, $descriptor( Type * ), SWIG_POINTER_DISOWN | %convertptr_flags );
    if ( SWIG_IsOK( check ) && argp ) {
      Type* arg = %reinterpret_cast( argp, Type * );
      // "Director" derived classes need special care
      if ( Swig::Director *director = SWIG_DIRECTOR_CAST( arg ) ) {
        PyObject_CallMethod( director->swig_get_self(), (char *) "__disown__", NULL );
      }
      result = Foam::tmp< Type >( arg );
    } else {
      %argument_fail( check, "$type", $symname, $argnum ); 
    }
  }
  $1 = &result;
}

%enddef


//---------------------------------------------------------------------------
%define TMP_TYPEMAP( Type )

%typecheck( SWIG_TYPECHECK_POINTER ) const Foam::tmp< Type >& 
{
  void *ptr;
  int res_tmpT = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::tmp< Type > * ), 0 );
  int res_T = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Type * ), 0 );
  $1 = SWIG_CheckState( res_T ) || SWIG_CheckState( res_tmpT );
}

%typemap( in ) const Foam::tmp< Type >& ( void  *argp = 0, int check = 0, Foam::tmp< Type > result ) 
{
  // First check the simplest case, complete coinsidence of the types
  check = SWIG_ConvertPtr( $input, &argp, $descriptor( Foam::tmp< Type > * ), %convertptr_flags );
  if ( SWIG_IsOK( check ) && argp ) {
    result = *%reinterpret_cast( argp, Foam::tmp< Type > * );
  } else {
    check = SWIG_ConvertPtr( $input, &argp, $descriptor( Type * ), SWIG_POINTER_DISOWN | %convertptr_flags );
    if ( SWIG_IsOK( check ) && argp ) {
      Type* arg = %reinterpret_cast( argp, Type * );
      result = Foam::tmp< Type >( arg );
    } else {
      %argument_fail( check, "$type", $symname, $argnum ); 
    }
  }
  $1 = &result;
}

%enddef


//---------------------------------------------------------------------------
#endif
