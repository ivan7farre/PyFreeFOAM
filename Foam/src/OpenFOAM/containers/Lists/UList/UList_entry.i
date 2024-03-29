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
#ifndef UList_entry_i
#define UList_entry_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.containers.Lists.UList.UList_entry";
%{
    #include "Foam/src/OpenFOAM/containers/Lists/UList/UList_entry.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/containers/Lists/UList/UList.i"
%import "Foam/src/OpenFOAM/db/dictionary/entry.i"

%ignore Foam::UList< Foam::entry >::writeEntry;
%ignore Foam::UList< Foam::entry >::swap;
                                      
%ignore Foam::UList< Foam::entry >::operator>;
%ignore Foam::UList< Foam::entry >::operator<;
%ignore Foam::UList< Foam::entry >::operator>=;
%ignore Foam::UList< Foam::entry >::operator<=;

%template( UList_entry ) Foam::UList< Foam::entry >; 

%extend Foam::UList< Foam::entry >
{
    int __len__()
    {
        return self->size();
    }
}


//---------------------------------------------------------------------------
#endif
