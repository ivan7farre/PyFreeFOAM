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
#ifndef face_i
#define face_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.meshes.meshShapes.face.face";
%{
   #include "Foam/src/OpenFOAM/meshes/meshShapes/face/face.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/Lists/labelList.i"

%import "Foam/src/OpenFOAM/meshes/primitiveShapes/point/pointField.i"

%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"

%ignore Foam::face::ray;
%ignore Foam::face::intersection;
%ignore Foam::face::nearestPoint;

#if FOAM_BRANCH_VERSION( __OPENFOAM_EXT__, >=, 010500 )
  %ignore Foam::face::fastIntersection;
#endif

%include <face.H>


//---------------------------------------------------------------------------
#endif
