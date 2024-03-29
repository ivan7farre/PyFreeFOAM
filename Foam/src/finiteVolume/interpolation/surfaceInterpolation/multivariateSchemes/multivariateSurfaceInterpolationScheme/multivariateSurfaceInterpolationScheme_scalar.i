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
#ifndef multivariateSurfaceInterpolationScheme_scalar_i
#define multivariateSurfaceInterpolationScheme_scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.interpolation.surfaceInterpolation.multivariateSchemes.multivariateSurfaceInterpolationScheme.multivariateSurfaceInterpolationScheme_scalar";
%{
  #include "Foam/src/finiteVolume/interpolation/surfaceInterpolation/multivariateSchemes/multivariateSurfaceInterpolationScheme/multivariateSurfaceInterpolationScheme_scalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/scalar.i"

%import "Foam/src/finiteVolume/interpolation/surfaceInterpolation/multivariateSchemes/multivariateSurfaceInterpolationScheme/multivariateSurfaceInterpolationScheme.i"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/OpenFOAM/fields/tmp/tmp_surfaceInterpolationScheme_scalar.i"


//---------------------------------------------------------------------------
%template (TfieldTable_scalar) Foam::TfieldTable< Foam::scalar >;

%ignore Foam::multivariateSurfaceInterpolationScheme< Foam::scalar >::New;
%ignore Foam::multivariateSurfaceInterpolationScheme< Foam::scalar >::fields;

%template( multivariateSurfaceInterpolationScheme_scalar ) Foam::multivariateSurfaceInterpolationScheme< Foam::scalar >;


//---------------------------------------------------------------------------
#endif
