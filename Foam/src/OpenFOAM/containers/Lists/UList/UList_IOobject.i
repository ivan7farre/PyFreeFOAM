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
#ifndef UList_IOobject_i
#define UList_IOobject_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.UList.UList_IOobject";
%{
    #include "Foam/src/OpenFOAM/containers/Lists/UList/UList_IOobject.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/Lists/UList/UList.i"
%import "Foam/src/OpenFOAM/db/IOobject.i"

%ignore Foam::UList< Foam::IOobject >::swap;
%ignore Foam::UList< Foam::IOobject >::writeEntry;
%ignore Foam::UList< Foam::IOobject >::operator==;
%ignore Foam::UList< Foam::IOobject >::operator!=;
%ignore Foam::UList< Foam::IOobject >::operator<=;
%ignore Foam::UList< Foam::IOobject >::operator>=;
%ignore Foam::UList< Foam::IOobject >::operator<;
%ignore Foam::UList< Foam::IOobject >::operator>;

%template( UList_IOobject ) Foam::UList< Foam::IOobject >;

%template( TContainer_word_IOobject ) Foam::TContainer_iterator< Foam::UList< Foam::IOobject > >;

%extend Foam::UList< Foam::IOobject > SEQUENCE_ADDONS( Foam::IOobject );


//---------------------------------------------------------------------------
#endif
