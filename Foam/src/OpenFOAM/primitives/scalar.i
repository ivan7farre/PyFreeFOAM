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
#ifndef scalar_i
#define scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.primitives.scalar";
%{
  #include "Foam/src/OpenFOAM/primitives/scalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

%include <doubleScalar.H>


//---------------------------------------------------------------------------
%typecheck( SWIG_TYPECHECK_POINTER ) Foam::scalar 
{
  $1 = PyFloat_Check( $input );
}


%typemap( in ) Foam::scalar
{
  Foam::scalar aValue = PyFloat_AsDouble( $input );
  $1 = $1_basetype( aValue );
}

%typecheck( SWIG_TYPECHECK_POINTER ) const Foam::scalar&
{
  $1 = PyFloat_Check( $input );
}


%typemap( in ) const Foam::scalar&
{
  Foam::scalar aValue = PyFloat_AsDouble( $input );
  $1 = new $*1_ltype( aValue );
}


//----------------------------------------------
%typemap( out ) Foam::scalar
{
  $result = PyFloat_FromDouble( $1 );
}

%typemap( out ) Foam::scalar*
{
  Foam::scalar aValue = *$1;
  $result = PyFloat_FromDouble( aValue );
}


%typemap( out ) const Foam::scalar &
{
  $result = PyFloat_FromDouble( *$1 );
}

%typemap( out ) Foam::scalar &
{
  $result = PyFloat_FromDouble( *$1 );
}


//---------------------------------------------------------------------------
namespace Foam
{ 
  struct scalar{};
}

%import "Foam/src/OpenFOAM/db/IOstreams/IOstreams/Istream.i"

%include <scalar.H>


//---------------------------------------------------------------------------
#endif
