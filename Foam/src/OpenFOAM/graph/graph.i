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
#ifndef graph_i
#define graph_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.graph.graph";
%{
  #include "Foam/src/OpenFOAM/graph/graph.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/strings/string.i"

%import "Foam/src/OpenFOAM/primitives/strings/fileName.i"

%import "Foam/src/OpenFOAM/meshes/primitiveShapes/point/point.i"

%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"

%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Istream.i"

%import "Foam/src/OpenFOAM/containers/HashTables/HashPtrTable/HashPtrTable_curve_word_string_hash.i"

%include <graph.H>


//---------------------------------------------------------------------------
#endif
