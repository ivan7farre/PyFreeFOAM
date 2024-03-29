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
#ifndef fixedGradientFvPatchField_scalar_i
#define fixedGradientFvPatchField_scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.fields.fvPatchFields.basic.fixedGradient.fixedGradientFvPatchField_scalar"
%{
    #include "Foam/src/finiteVolume/fields/fvPatchFields/basic/fixedGradient/fixedGradientFvPatchField_scalar.hh"
%}

%import "Foam/src/director.hxx"


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/Fields/primitiveFields.i"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/finiteVolume/fields/fvPatchFields/basic/fixedGradient/fixedGradientFvPatchField.i"

%feature( "director" ) fixedGradientFvPatchScalarField;

%inline
{
  namespace Foam 
  {
    typedef fixedGradientFvPatchField< scalar > fixedGradientFvPatchScalarField;
  }
}


//---------------------------------------------------------------------------
%ignore Foam::fixedGradientFvPatchField< Foam::scalar >::snGrad;
%ignore Foam::fixedGradientFvPatchField< Foam::scalar >::gradientBoundaryCoeffs;

DIRECTOR_PRE_EXTENDS( fixedGradientFvPatchScalarField );


//---------------------------------------------------------------------------
%template( fixedGradientFvPatchScalarField ) Foam::fixedGradientFvPatchField< Foam::scalar >;


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/objectRegistry.i"

%extend Foam::fixedGradientFvPatchField< Foam::scalar >
{
  DIRECTOR_EXTENDS( fixedGradientFvPatchScalarField );
  TYPEINFO_DIRECTOR_EXTENDS( fvPatchScalarField, fixedGradientFvPatchScalarField );
  COMMON_FIXEDGRADIENT_FVPATCHFIELD_TEMPLATE_FUNC_EXTENDS( Foam::scalar );
}


//---------------------------------------------------------------------------
#endif
