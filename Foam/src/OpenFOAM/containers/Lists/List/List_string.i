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
#ifndef List_string_i
#define List_string_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.List.List_string";
%{
   #include "Foam/src/OpenFOAM/containers/Lists/List/List_string.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/Lists/List/List.i"

%import "Foam/src/OpenFOAM/containers/Lists/UList/UList_string.i"

%template( List_string ) Foam::List< Foam::string >; 

%extend Foam::List< Foam::string > COMMON_EXTENDS;


//---------------------------------------------------------------------------
#endif
