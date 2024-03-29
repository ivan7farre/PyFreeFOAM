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
#ifndef symmTensor_i
#define symmTensor_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.primitives.symmTensor";
%{
  #include "Foam/src/OpenFOAM/primitives/symmTensor.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/vector.i"

%import "Foam/src/OpenFOAM/primitives/scalar.i"

%import "Foam/src/OpenFOAM/primitives/S_ymmTensor.i"

%import "Foam/src/OpenFOAM/primitives/contiguous.i"

%template( VectorSpace_symmTensor ) Foam::VectorSpace< Foam::SymmTensor< Foam::scalar >, Foam::scalar, 6 >;


//---------------------------------------------------------------------------
%extend Foam::VectorSpace< Foam::SymmTensor< Foam::scalar >, Foam::scalar, 6 >
{
  int __len__()
  {
    return self->size();
  }
  
  Foam::scalar __getitem__( const Foam::direction theIndex )
  {
    return self->operator[]( theIndex );
  }
  
  void __setitem__( const Foam::direction theIndex, const Foam::scalar& theValue )
  {
    self->operator[]( theIndex ) = theValue;
  }
}

%include <symmTensor.H>

%template ( symmTensor ) Foam::SymmTensor< Foam::scalar >;


//---------------------------------------------------------------------------
%extend Foam::SymmTensor< Foam::scalar >
{
  Foam::Vector< Foam::scalar > __rand__( const Foam::Vector< Foam::scalar >& theArg )
  {
    return theArg & *self;
  }
}


//----------------------------------------------------------------------------
#endif
