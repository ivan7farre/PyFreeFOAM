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
#ifndef tmp_multivariateSurfaceInterpolationScheme_scalar_i
#define tmp_multivariateSurfaceInterpolationScheme_scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.fields.tmp.tmp_multivariateSurfaceInterpolationScheme_scalar"
%{
  #include "Foam/src/OpenFOAM/fields/tmp/tmp_multivariateSurfaceInterpolationScheme_scalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/tmp.i"

%import "Foam/src/finiteVolume/interpolation/surfaceInterpolation/multivariateSchemes/multivariateSurfaceInterpolationScheme/multivariateSurfaceInterpolationScheme_scalar.i"

%ignore Foam::tmp< Foam::multivariateSurfaceInterpolationScheme< Foam::scalar > >::ptr;

%template( tmp_multivariateSurfaceInterpolationScheme_scalar ) Foam::tmp< Foam::multivariateSurfaceInterpolationScheme< Foam::scalar > >;

%feature( "pythonappend" ) Foam::tmp< Foam::multivariateSurfaceInterpolationScheme< Foam::scalar > >::SMARTPTR_PYAPPEND_GETATTR( tmp_multivariateSurfaceInterpolationScheme_scalar );

%extend Foam::tmp< Foam::multivariateSurfaceInterpolationScheme< Foam::scalar > >
{
  SMARTPTR_EXTEND_ATTR( tmp_multivariateSurfaceInterpolationScheme_scalar );
}

//---------------------------------------------------------------------------
#endif
