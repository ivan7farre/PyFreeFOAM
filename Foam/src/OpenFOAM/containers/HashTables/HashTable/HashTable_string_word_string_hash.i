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
#ifndef HashTable_string_word_string_hash_i
#define HashTable_string_word_string_hash_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.HashTables.HashTable.HashTable_string_word_string_hash";
%{
   #include "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable_string_word_string_hash.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable.i"

%import "Foam/src/OpenFOAM/primitives/strings/string.i"

%ignore Foam::HashTable< Foam::string, Foam::word, Foam::string_hash >::HashTable;
%ignore Foam::HashTable< Foam::string, Foam::word, Foam::string_hash >::begin;
%ignore Foam::HashTable< Foam::string, Foam::word, Foam::string_hash >::find;

#if FOAM_VERSION( >=, 010600 )
%ignore Foam::HashTable< Foam::string, Foam::word, Foam::string_hash >::cbegin;
#endif

%template( HashTable_string_word_string_hash ) Foam::HashTable< Foam::string, Foam::word, Foam::string_hash >; 

%template( TContainer_word_string ) Foam::TContainer_iterator< Foam::HashTable< Foam::string, Foam::word, Foam::string_hash > >;

HASHTABLE_ADDONS( Foam::string, Foam::word, Foam::string_hash )


//---------------------------------------------------------------------------
#endif
