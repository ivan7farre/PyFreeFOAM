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
#ifndef fvmD2dt2_i
#define fvmD2dt2_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.finiteVolume.fvm.fvmD2dt2";
%{
  #include "Foam/src/finiteVolume/finiteVolume/fvm/fvmD2dt2.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/finiteVolume/fvMatrices/fvMatrices.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.i"


//---------------------------------------------------------------------------
%define FVM_D2DT2_TEMPLATE_FUNC( Type )
%{
  Foam::tmp< Foam::fvMatrix< Type > > 
  fvm_d2dt2( Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvm::d2dt2( vf );
  }

  Foam::tmp< Foam::fvMatrix< Type > > 
  fvm_d2dt2( const Foam::dimensionedScalar& rho,
             Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvm::d2dt2( rho, vf );
  }

  Foam::tmp< Foam::fvMatrix< Type > > 
  fvm_d2dt2( const Foam::volScalarField& rho,
             Foam::GeometricField< Type, Foam::fvPatchField, Foam::volMesh >& vf )
  {
    return Foam::fvm::d2dt2( rho, vf );
  }
%}
%enddef


//---------------------------------------------------------------------------
%inline FVM_D2DT2_TEMPLATE_FUNC( Foam::scalar );

%inline FVM_D2DT2_TEMPLATE_FUNC( Foam::vector );


//---------------------------------------------------------------------------
%include <fvmD2dt2.H>


//---------------------------------------------------------------------------
#endif
