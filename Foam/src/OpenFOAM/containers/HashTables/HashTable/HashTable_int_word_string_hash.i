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
#ifndef HashTable_int_word_string_hash_i
#define HashTable_int_word_string_hash_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.HashTables.HashTable.HashTable_int_word_string_hash";
%{
   #include "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable_int_word_string_hash.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable.i"

%ignore Foam::HashTable< int, Foam::word, Foam::string_hash >::begin;
%ignore Foam::HashTable< int, Foam::word, Foam::string_hash >::find;

#if FOAM_VERSION( >=, 010600 )
  %ignore Foam::HashTable< int, Foam::word, Foam::string_hash >::cbegin;
#endif

%template( HashTable_int_word_string_hash ) Foam::HashTable< int, Foam::word, Foam::string_hash >; 

HASHTABLE_ADDONS( int, Foam::word, Foam::string_hash );


//---------------------------------------------------------------------------
%typemap( typecheck ) const Foam::HashTable< int > &
{
  void *ptr;
  int res = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::HashTable< int, Foam::word, Foam::string_hash >* ), 0 );
  $1 = SWIG_CheckState( res );
}

%typemap( in ) const Foam::HashTable< int > &
{
  void *ptr;
  int res = SWIG_ConvertPtr( $input, (void **) &ptr, $descriptor( Foam::HashTable< int, Foam::word, Foam::string_hash >* ), 0 );
  if ( SWIG_IsOK( res ) ) {
    $1 = reinterpret_cast< $1_ltype >( ptr );
  } else {
    %argument_fail( res, "$type", $symname, $argnum ); 
  }
}


//---------------------------------------------------------------------------
#endif
