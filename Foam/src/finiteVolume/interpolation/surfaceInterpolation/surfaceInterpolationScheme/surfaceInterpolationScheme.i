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
#ifndef surfaceInterpolationScheme_i
#define surfaceInterpolationScheme_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.interpolation.surfaceInterpolation.surfaceInterpolationScheme.surfaceInterpolationScheme";
%{
  #include "Foam/src/finiteVolume/interpolation/surfaceInterpolation/surfaceInterpolationScheme/surfaceInterpolationScheme.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%include <surfaceInterpolationScheme.H>


//---------------------------------------------------------------------------
%define SURFACEINTRPOLATIONSCHEME_TEMPLATE_FUNC( Type )
{
  Foam::surfaceScalarField& 
  ext_weights( const Foam::GeometricField< Foam::Type, Foam::fvPatchField, Foam::volMesh >& theArg )
  {
    return self->weights( theArg )();
  }
   
  static Foam::tmp< Foam::GeometricField< Foam::Type, Foam::fvsPatchField, Foam::surfaceMesh > >
  ext_interpolate( const Foam::GeometricField< Foam::Type, fvPatchField, volMesh >& vf,
                   const Foam::tmp< Foam::surfaceScalarField >& tlambdas,
                   const Foam::tmp< Foam::surfaceScalarField >& tys )
  {
    return Foam::surfaceInterpolationScheme< Foam::Type >::interpolate( vf, tlambdas, tys );
  }
   
  static Foam::tmp< Foam::GeometricField< Foam::Type, Foam::fvsPatchField, Foam::surfaceMesh > >
  ext_interpolate( const Foam::GeometricField< Foam::Type, fvPatchField, volMesh >& vf,
                   const Foam::tmp< Foam::surfaceScalarField >& tlambdas )
  {
    return Foam::surfaceInterpolationScheme< Foam::Type >::interpolate( vf, tlambdas );
  }
}
%enddef


//---------------------------------------------------------------------------
#endif
