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
#ifndef fvcLaplacian_i
#define fvcLaplacian_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.finiteVolume.fvc.fvcLaplacian";
%{
  #include "Foam/src/finiteVolume/finiteVolume/fvc/fvcLaplacian.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/finiteVolume/interpolation/surfaceInterpolation/surfaceInterpolate.i"


//---------------------------------------------------------------------------
%define FVC_LAPLACIAN_TEMPLATE_FUNC( Type1, Type2 )
%{
  Foam::tmp< Foam::GeometricField< Type1, Foam::fvPatchField, Foam::volMesh> > 
  fvc_laplacian( const Foam::GeometricField< Type2, Foam::fvPatchField, Foam::volMesh>& gamma,
                 const Foam::GeometricField< Type1, Foam::fvPatchField, Foam::volMesh>& vf )
  {
    return Foam::fvc::laplacian( gamma, vf );
  }
%}
%enddef 


//---------------------------------------------------------------------------
%inline FVC_LAPLACIAN_TEMPLATE_FUNC( Foam::scalar, Foam::scalar );


//---------------------------------------------------------------------------
%include <fvcLaplacian.H>


//---------------------------------------------------------------------------
#endif
