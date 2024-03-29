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
#ifndef string_i
#define string_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.primitives.strings.string";
%{
  #include "Foam/src/OpenFOAM/primitives/strings/string.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"


//---------------------------------------------------------------------------
// This trick intends to publish nested class into SWIG domain
namespace Foam
{
  struct string_hash 
  {};
}


//---------------------------------------------------------------------------
%typecheck( SWIG_TYPECHECK_POINTER ) const Foam::string &
{
  void *ptr;
  if ( SWIG_ConvertPtr( $input, (void **) &ptr, $1_descriptor, 0 ) == -1 ) {
    char* aString = PyString_AsString( $input );
    $1 = ( aString != 0 );
  } else {
    $1 = true;
  }
}

%typemap( in ) const Foam::string &
{
  void *ptr;
  if ( SWIG_ConvertPtr( $input, (void **) &ptr, $1_descriptor, 0 ) == -1 ) {
    char* aString = PyString_AsString( $input );

    if ( !aString ) {
      SWIG_exception_fail(SWIG_ValueError, "can not convert input argument to Foam::string& "); 
    }
    
    $1 = new $1_basetype( aString );
  } else {
    $1 = reinterpret_cast< $1_ltype >( ptr );
  }
}


//---------------------------------------------------------------------------
%include "std_string.i"

%include <string.H>

%extend Foam::string
{
  int __len__()
  {
    return self->size();
  }
  
  char __getitem__( size_t theIndex )
  {
    return self->at( theIndex );
  }
  
  const char* __str__()
  {
    return self->c_str();
  }
}


//---------------------------------------------------------------------------
#endif
