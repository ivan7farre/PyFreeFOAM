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
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.PtrList_basicPsiThermo";
%{
   #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_basicPsiThermo.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

#if FOAM_VERSION( <, 010600 )
#define PtrList_basicPsiThermo_i
#endif


//---------------------------------------------------------------------------
#ifndef PtrList_basicPsiThermo_i
#define PtrList_basicPsiThermo_i


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/autoPtr_basicPsiThermo.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"

%ignore Foam::PtrList< Foam::basicPsiThermo >::PtrList;
%ignore Foam::PtrList< Foam::basicPsiThermo >::begin;
%ignore Foam::PtrList< Foam::basicPsiThermo >::end;
%ignore Foam::PtrList< Foam::basicPsiThermo >::set;

#if FOAM_VERSION( >=, 010600 )
%ignore Foam::PtrList< Foam::basicPsiThermo >::xfer;
#endif

%template( PtrList_basicPsiThermo ) Foam::PtrList< Foam::basicPsiThermo >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::basicPsiThermo >
{
  Foam::PtrList< Foam::basicPsiThermo >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::basicPsiThermo >( s );
  }
}

%extend Foam::PtrList< Foam::basicPsiThermo > PTRLISTBASED_ADDONS( Foam::basicPsiThermo );


//---------------------------------------------------------------------------
#endif
