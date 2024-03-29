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
#ifndef fvmSup_i
#define fvmSup_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.finiteVolume.fvm.fvmSup";
%{
  #include "Foam/src/finiteVolume/finiteVolume/fvm/fvmSup.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/finiteVolume/fvMatrices/fvMatrices.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.i"


//---------------------------------------------------------------------------
%define FVM_SUP_TEMPLATE_FUNC( Type )
%{
#if FOAM_VERSION( <, 010500 )
  Foam::tmp<Foam::fvMatrix<Type> > 
  fvm_Sp( const Foam::volScalarField& sp, 
          Foam::GeometricField<Type, Foam::fvPatchField, Foam::volMesh>& vf )
  {
    return Foam::fvm::Sp( sp, vf );
  }

  /* The zero is not implemented yet
  Foam::zero
  Sp( const zero&, GeometricField<Type, fvPatchField, volMesh>& )
  {
  return zero();
  }
  */
#endif
    
#if FOAM_VERSION( >=, 010500 )
  Foam::tmp<Foam::fvMatrix<Type> > 
   fvm_Sp( const Foam::DimensionedField<scalar, volMesh>& sp, 
           Foam::GeometricField<Type, Foam::fvPatchField, Foam::volMesh>& vf )
  {
    return Foam::fvm::Sp( sp, vf );
  }

  /* The zeroField is not implemented yet
  Foam::zeroField 
  Sp( const zeroField&, GeometricField<Type, fvPatchField, volMesh>& )
  {
  return zeroField();
  }
  */
#endif
   
  Foam::tmp<Foam::fvMatrix<Type> > 
  fvm_Sp( const Foam::tmp<volScalarField>& tsp, 
          Foam::GeometricField<Type, Foam::fvPatchField, Foam::volMesh>& vf )
  {
    return Foam::fvm::Sp( tsp, vf );
  }
    
  Foam::tmp<Foam::fvMatrix<Type> > 
  fvm_Sp( const Foam::dimensionedScalar& sp, 
          Foam::GeometricField<Type, Foam::fvPatchField, Foam::volMesh>& vf )
  {
    return Foam::fvm::Sp( sp, vf );
  }
%}
%enddef


//---------------------------------------------------------------------------
%inline FVM_SUP_TEMPLATE_FUNC( Foam::scalar );

%inline FVM_SUP_TEMPLATE_FUNC( Foam::vector );


//---------------------------------------------------------------------------
%include <fvmSup.H>


//---------------------------------------------------------------------------
#endif
