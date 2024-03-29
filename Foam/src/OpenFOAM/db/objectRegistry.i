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
#ifndef objectRegistry_i
#define objectRegistry_i


//---------------------------------------------------------------------------
%module( directors="1", allprotected="1" ) "Foam.src.OpenFOAM.db.objectRegistry";
%{
   #include "Foam/src/OpenFOAM/db/objectRegistry.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable_regIOobject_word_string_hash.i"

%include <objectRegistry.H>

%ignore Foam::objectRegistry::writeObject;


//---------------------------------------------------------------------------
%define OBJECTREGISTRY_EXTENDS( Typename )
  static const Foam::Typename&
  ext_lookupObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.lookupObject< Foam::Typename >( theName );
  }
  
  static bool ext_foundObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.foundObject< Foam::Typename >( theName );
  }
%enddef


//----------------------------------------------------------------------------
%define OBJECTREGISTRY_TEMPLATE_2_EXTENDS( Template, Type1, Type2  )
  static const Foam::Template< Type1, Type2 >&
  ext_lookupObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.lookupObject< Foam::Template< Type1, Type2 > >( theName );
  }
  
  static bool ext_foundObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.foundObject< Foam::Template< Type1, Type2 > >( theName );
  }
%enddef


//----------------------------------------------------------------------------
%define OBJECTREGISTRY_TEMPLATE_3_EXTENDS( Template, Type1, Type2, Type3 )
  static const Foam::Template< Type1, Type2, Type3 >&
  ext_lookupObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.lookupObject< Foam::Template< Type1, Type2, Type3 > >( theName );
  }
  
  static bool ext_foundObject( const Foam::objectRegistry& theRegistry, const Foam::word& theName )
  {
    return theRegistry.foundObject< Foam::Template< Type1, Type2, Type3 > >( theName );
  }
%enddef


//----------------------------------------------------------------------------
#endif
