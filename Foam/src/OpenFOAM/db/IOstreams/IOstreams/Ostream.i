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
#ifndef Ostream_i
#define Ostream_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.db.IOstreams.IOstreams.Ostream";
%{
   #include "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Ostream.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/IOstream.i"

%import "Foam/src/OpenFOAM/primitives/scalar.i"

%import "Foam/src/OpenFOAM/primitives/strings/keyType.i"

%import "Foam/src/OpenFOAM/db/IOstreams/token.i"

// To avoid cyclic dependencies
//%import "Foam/src/OpenFOAM/db/dictionary/dictionary.i"

%rename( ext_print ) Foam::Ostream::print;

%include <Ostream.H>


//---------------------------------------------------------------------------
%extend Foam::Ostream
{
  Foam::Ostream& __lshift__( char theArg )
  {
    return *self << theArg;
  }

  Foam::Ostream& __lshift__( const char* theArg )
  {
    return *self << theArg;
  }

  Foam::Ostream& __lshift__( const token& theArg )
  {
    return *self << theArg;
  }

  Foam::Ostream& __lshift__( const word& theArg )
  {
    return *self << theArg;
  }

  Foam::Ostream& __lshift__( label theArg )
  {
    return *self << theArg;
  }

  Foam::Ostream& __lshift__( scalar theArg )
  {
    return *self << theArg;
  }
}


//---------------------------------------------------------------------------
%define OSTREAM_EXTENDS
{
  Foam::Ostream& __rlshift__( Foam::Ostream& theOstream )
  {
    return theOstream << *self;
  }
}
%enddef


//---------------------------------------------------------------------------
#endif
