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
#ifndef fvcDdt_i
#define fvcDdt_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.finiteVolume.fvc.fvcDdt";
%{
  #include "Foam/src/finiteVolume/finiteVolume/fvc/fvcDdt.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.i"
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"


//---------------------------------------------------------------------------
%define FVC_DDT_TEMPLATE_FUNC( Type )
%{
  Foam::tmp< Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh> > 
  fvc_ddt( const Foam::dimensioned< Type > dt, 
           const Foam::fvMesh& mesh )
  {
    return Foam::fvc::ddt( dt, mesh );
  }

  Foam::tmp< Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh> > 
  fvc_ddt( Foam::GeometricField< Type, 
           Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvc::ddt( vf );
  }

  Foam::tmp< Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh> > 
  fvc_ddt( const Foam::dimensionedScalar& rho, 
           Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvc::ddt( rho, vf );
  }

  Foam::tmp< Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh> > 
  fvc_ddt( const Foam::volScalarField& rho, 
           Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvc::ddt( rho, vf );
  }
%}
%enddef


//---------------------------------------------------------------------------
%inline FVC_DDT_TEMPLATE_FUNC( Foam::scalar )


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedVector.i"
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%inline FVC_DDT_TEMPLATE_FUNC( Foam::vector )


//---------------------------------------------------------------------------
%inline
{
  Foam::tmp< Foam::GeometricField< Foam::scalar, Foam::fvsPatchField, Foam::surfaceMesh > > 
  fvc_ddtPhiCorr( const Foam::volScalarField& rA,
                  const Foam::GeometricField< Foam::vector, Foam::fvPatchField, Foam::volMesh >& U,
                  const Foam::GeometricField< Foam::scalar, Foam::fvsPatchField, Foam::surfaceMesh >& phi )
  {
    return Foam::fvc::ddtPhiCorr( rA, U, phi );
  }

  Foam::tmp< Foam::GeometricField< Foam::scalar, Foam::fvsPatchField, Foam::surfaceMesh > > 
  fvc_ddtPhiCorr( const Foam::volScalarField& rA,
                  const Foam::volScalarField& rho,
                  const Foam::GeometricField< Foam::vector, Foam::fvPatchField, Foam::volMesh >& U,
                  const Foam::GeometricField< Foam::scalar, Foam::fvsPatchField, Foam::surfaceMesh >& phi )
  {
    return Foam::fvc::ddtPhiCorr( rA, rho, U, phi );
  }
}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"


//---------------------------------------------------------------------------
%include <fvcDdt.H>


//---------------------------------------------------------------------------
#endif
