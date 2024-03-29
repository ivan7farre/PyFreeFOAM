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
#ifndef PtrList_porousZone_i
#define PtrList_porousZone_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.PtrList.PtrList_porousZone";
%{
  #include "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_porousZone.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/cfdTools/general/porousMedia/porousZone.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList.i"

%ignore Foam::PtrList< Foam::porousZone >::PtrList;
%ignore Foam::PtrList< Foam::porousZone >::begin;
%ignore Foam::PtrList< Foam::porousZone >::end;
%ignore Foam::PtrList< Foam::porousZone >::set;

#if FOAM_VERSION( >=, 010600 )
  %ignore Foam::PtrList< Foam::porousZone >::xfer;
#endif

%template( PtrList_porousZone ) Foam::PtrList< Foam::porousZone >;


//---------------------------------------------------------------------------
%extend Foam::PtrList< Foam::porousZone >
{
  Foam::PtrList< Foam::porousZone >( const Foam::label s )
  {
    return new Foam::PtrList< Foam::porousZone >( s );
  }
}

%extend Foam::PtrList< Foam::porousZone > PTRLISTBASED_ADDONS( Foam::porousZone )


//---------------------------------------------------------------------------
#endif
