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
#ifndef dimensionedVector_i
#define dimensionedVector_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.dimensionedTypes.dimensionedVector";
%{
  #include "Foam/src/OpenFOAM/dimensionedTypes/dimensionedVector.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedType.i"

%import "Foam/src/OpenFOAM/primitives/vector.i"

%import "Foam/src/OpenFOAM/primitives/tensor.i"

%ignore Foam::dimensioned< Foam::vector >::component;
%ignore Foam::dimensioned< Foam::vector >::replace;
%ignore Foam::dimensioned< Foam::vector >::T;

%typedef Foam::dimensioned< Foam::vector > dimensionedVector;

%typemap( out ) Foam::dimensioned< Foam::vector >
{
  $result = SWIG_NewPointerObj( ( new $1_type( *&$1 ) ), $&1_descriptor, SWIG_POINTER_OWN |  0 );
}


//-----------------------------------------------------------------------
PYAPPEND_RETURN_SELF_COMPOUND_OPERATOR_TEMPLATE_1(Foam::dimensioned, Foam::vector, operator+= )


//-----------------------------------------------------------------------
%template( dimensionedVector ) Foam::dimensioned< Foam::vector >; 

%include <dimensionedVector.H>


//------------------------------------------------------------------------
%import "Foam/src/try_reverse_operator.hxx"

%feature ("pythonprepend") Foam::dimensioned< Foam::vector >::TRY_REVERSE_PYPREPEND( and );
%feature ("pythonprepend") Foam::dimensioned< Foam::vector >::TRY_REVERSE_PYPREPEND( sub );
%feature ("pythonprepend") Foam::dimensioned< Foam::vector >::TRY_REVERSE_PYPREPEND( add );
%feature ("pythonprepend") Foam::dimensioned< Foam::vector >::TRY_REVERSE_PYPREPEND( xor );


//-------------------------------------------------------------------------
DIMENSIONEDTYPE_ADDONS( Foam::vector )

%extend Foam::dimensioned< Foam::vector >
{
  Foam::dimensioned< Foam::scalar > __and__( const Foam::dimensioned< Foam::vector >& ds )
  {
    return *self & ds;
  }
  Foam::dimensioned< Foam::vector > __rand__( const Foam::tensor& ds )
  {
    return *self & ds;
  }
  TRY_REVERSE_EXTEND( xor );
}


//---------------------------------------------------------------------------
CLEAR_PYAPPEND_RETURN_SELF_COMPOUND_OPERATOR_TEMPLATE_1(Foam::dimensioned, Foam::vector, operator+= );


//---------------------------------------------------------------------------
#endif
