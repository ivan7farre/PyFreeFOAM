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
#ifndef DimensionedField_sphericalTensor_surfaceMesh_cpp
#define DimensionedField_sphericalTensor_surfaceMesh_cpp


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.fields.DimensionedFields.DimensionedField_sphericalTensor_surfaceMesh";
%{
  #include "Foam/src/OpenFOAM/fields/DimensionedFields/DimensionedField_sphericalTensor_surfaceMesh.hh"
%}


//---------------------------------------------------------------------------
%include "Foam/src/OpenFOAM/fields/DimensionedFields/DimensionedField.cpp"

%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"
%import "Foam/src/finiteVolume/surfaceMesh.hpp"

DIMENSIONED_FIELD_SURFACEMESH_TYPEMAP( sphericalTensor );

%ignore Foam::DimensionedField< Foam::sphericalTensor, Foam::surfaceMesh >::typeName;
%ignore Foam::DimensionedField< Foam::sphericalTensor, Foam::surfaceMesh >::debug;
%ignore Foam::DimensionedField< Foam::sphericalTensor, Foam::surfaceMesh >::T;

DIMENSIONED_FIELD_TEMPLATE_FUNC( sphericalTensor, surfaceMesh );

%template( DimensionedField_sphericalTensor_surfaceMesh ) Foam::DimensionedField< Foam::sphericalTensor, Foam::surfaceMesh >;


//---------------------------------------------------------------------------

#endif
