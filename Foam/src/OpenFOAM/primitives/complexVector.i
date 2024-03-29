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
#ifndef complexVector_i
#define complexVector_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.primitives.complexVector";
%{
  #include "Foam/src/OpenFOAM/primitives/complexVector.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

%import "Foam/src/OpenFOAM/primitives/complex.i"

%import "Foam/src/OpenFOAM/primitives/vector.i"

%template( VectorSpace_complex ) Foam::VectorSpace< Foam::Vector< Foam::complex >, Foam::complex, 3 >;


//---------------------------------------------------------------------------
%include <complexVector.H>

%ignore Foam::Vector< Foam::complex >::max;
%ignore Foam::Vector< Foam::complex >::min;

%template( complexVector ) Foam::Vector< Foam::complex >;


//---------------------------------------------------------------------------
#endif
