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
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.PtrList_basicRhoThermo";
%{
  #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_basicRhoThermo.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

#if FOAM_VERSION( <, 010600 )
#define PtrList_basicRhoThermo_i
#endif


//---------------------------------------------------------------------------
#ifndef PtrList_basicRhoThermo_i
#define PtrList_basicRhoThermo_i


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/autoPtr_basicRhoThermo.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"

%ignore Foam::PtrList< Foam::basicRhoThermo >::PtrList;
%ignore Foam::PtrList< Foam::basicRhoThermo >::begin;
%ignore Foam::PtrList< Foam::basicRhoThermo >::end;
%ignore Foam::PtrList< Foam::basicRhoThermo >::set;
%ignore Foam::PtrList< Foam::basicRhoThermo >::xfer;


%template( PtrList_basicRhoThermo ) Foam::PtrList< Foam::basicRhoThermo >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::basicRhoThermo >
{
  Foam::PtrList< Foam::basicRhoThermo >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::basicRhoThermo >( s );
  }
}

%extend Foam::PtrList< Foam::basicRhoThermo > PTRLISTBASED_ADDONS( Foam::basicRhoThermo );


//---------------------------------------------------------------------------
#endif
