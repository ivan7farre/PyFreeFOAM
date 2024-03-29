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
#ifndef dimensionSet_i
#define dimensionSet_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.dimensionSet";
%{
  #include "Foam/src/OpenFOAM/dimensionSet.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/typeInfo/className.hxx"

%import "Foam/src/OpenFOAM/primitives/scalar.i"

%include <dimensionSet.H>

%typemap( out ) Foam::dimensionSet
{
  $result = SWIG_NewPointerObj( ( new $1_type( *&$1 ) ), $&1_descriptor, SWIG_POINTER_OWN |  0 );
}

%extend Foam::dimensionSet
{
  Foam::dimensionSet __div__( const const dimensionSet& ds2 )
  {
    return *self / ds2;
  }
  
  Foam::dimensionSet __mul__( const dimensionSet& ds2 )
  {
    return *self * ds2;
  }
}


//---------------------------------------------------------------------------
#endif
