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
#ifndef dimensionedTensor_i
#define dimensionedTensor_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.dimensionedTypes.dimensionedTensor";
%{
  #include "Foam/src/OpenFOAM/dimensionedTypes/dimensionedTensor.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedTypes.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedSymmTensor.i"

%include <dimensionedTensor.H>

typedef Foam::dimensioned< Foam::tensor > dimensionedTensor;

%template( dimensionedTensor ) Foam::dimensioned< Foam::tensor >; 

%feature ( "pythonprepend" ) Foam::dimensioned< Foam::tensor >::TRY_REVERSE_PYPREPEND( add );
%feature ( "pythonprepend" ) Foam::dimensioned< Foam::tensor >::TRY_REVERSE_PYPREPEND( sub );

DIMENSIONEDTYPE_ADDONS( Foam::tensor )


//---------------------------------------------------------------------------
#endif
