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
#ifndef surfaceInterpolationScheme_scalar_i
#define surfaceInterpolationScheme_scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.interpolation.surfaceInterpolation.surfaceInterpolationScheme.surfaceInterpolationScheme_scalar";
%{
  #include "Foam/src/finiteVolume/interpolation/surfaceInterpolation/surfaceInterpolationScheme/surfaceInterpolationScheme_scalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/finiteVolume/interpolation/surfaceInterpolation/surfaceInterpolationScheme/surfaceInterpolationScheme.i"

%ignore Foam::surfaceInterpolationScheme< Foam::scalar >::typeName;
%ignore Foam::surfaceInterpolationScheme< Foam::scalar >::debug;
%ignore Foam::surfaceInterpolationScheme< Foam::scalar >::weights;

%template( surfaceInterpolationScheme_scalar) Foam::surfaceInterpolationScheme< Foam::scalar >;

%extend Foam::surfaceInterpolationScheme< Foam::scalar > SURFACEINTRPOLATIONSCHEME_TEMPLATE_FUNC( scalar );


//---------------------------------------------------------------------------
#endif
