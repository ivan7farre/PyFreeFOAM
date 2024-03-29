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
#ifndef fvVectorMatrix_cpp
#define fvVectorMatrix_cpp


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.fvMatrices.fvVectorMatrix";
%{
  #include "Foam/src/finiteVolume/fvMatrices/fvVectorMatrix.hh"
%}


 //---------------------------------------------------------------------------
%include "Foam/src/finiteVolume/fvMatrices/fvMatrix.cpp"

%import "Foam/src/OpenFOAM/primitives/vector.i"

%import "Foam/src/OpenFOAM/dimensionSet.i"

%ignore Foam::fvMatrix< Foam::vector >::debug;
%ignore Foam::fvMatrix< Foam::vector >::typeName;

%ignore Foam::fvMatrix< Foam::vector >::addBoundaryDiag;
%ignore Foam::fvMatrix< Foam::vector >::addCmptAvBoundaryDiag;
%ignore Foam::fvMatrix< Foam::vector >::addBoundarySource;

%ignore Foam::fvMatrix< Foam::vector >::solver;

FVMATRIX_TEMPLATE_FUNC( Foam::vector );

%template( fvVectorMatrix ) Foam::fvMatrix< Foam::vector >;

%include "Foam/src/finiteVolume/fvMatrices/fvVectorMatrix.hh"


//---------------------------------------------------------------------------
#endif
