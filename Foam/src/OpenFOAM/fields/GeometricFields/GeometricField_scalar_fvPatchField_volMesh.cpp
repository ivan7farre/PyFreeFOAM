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
#ifndef GeometricField_scalar_fvPatchField_volMesh_cpp
#define GeometricField_scalar_fvPatchField_volMesh_cpp


//---------------------------------------------------------------------------
%{
  #include "Foam/src/OpenFOAM/fields/GeometricFields/GeometricField_scalar_fvPatchField_volMesh.hh"
%}


//---------------------------------------------------------------------------
%include "Foam/src/OpenFOAM/fields/FieldFields/FieldField.cpp"

%import "Foam/src/OpenFOAM/fields/tmp/refCount.i"

%import "Foam/src/OpenFOAM/containers/Lists/PtrList/PtrList_scalarField.i"

%include "Foam/src/OpenFOAM/fields/FieldFields/FieldField_fvPatchField_scalar.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/tmp_FieldField_fvPatchField_scalar.cpp"


//---------------------------------------------------------------------------
%include "Foam/src/OpenFOAM/fields/GeometricFields/GeometricField.cpp"

%include "Foam/src/OpenFOAM/fields/DimensionedFields/DimensionedField_scalar_volMesh.cpp"

%include "Foam/src/OpenFOAM/fields/tmp/tmp_DimensionedField_scalar_volMesh.cpp"


//---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fields/fvPatchFields/fvPatchField_scalar.cpp"

%template ( TGeometricBoundaryField_scalar_fvPatchField_volMesh ) Foam::TGeometricBoundaryField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >;

%feature( "pythonappend" ) Foam::TGeometricBoundaryField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::NESTEDCLASS_PYAPPEND_GETATTR( TGeometricBoundaryField_scalar_fvPatchField_volMesh );

%extend Foam::TGeometricBoundaryField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >
{
  NESTEDCLASS_EXTEND_ATTR( TGeometricBoundaryField_scalar_fvPatchField_volMesh );
  TGEOM_BOUND_FIELD_GETITEM_EXTEND( Foam::fvPatchScalarField );
  TGEOM_BOUND_FIELD_FVPATCHFIELD_EXTENDS();
  
  TGEOM_BOUND_FIELD_SCALAR_OPERATORS( Foam::fvPatchField, Foam::volMesh );
}


//----------------------------------------------------------------------------
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::debug;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::typeName;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::boundaryField;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::scale;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::min;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::max;
%ignore Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >::T;

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.i"


//---------------------------------------------------------------------------
%template( GeometricField_scalar_fvPatchField_volMesh ) Foam::GeometricField< Foam::scalar, Foam::fvPatchField, Foam::volMesh >;

SCALAR_GEOMETRIC_FIELD_TEMPLATE_FUNC( Foam::fvPatchField, Foam::volMesh );


//---------------------------------------------------------------------------
#endif
