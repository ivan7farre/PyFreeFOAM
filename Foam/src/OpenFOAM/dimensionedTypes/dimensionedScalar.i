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
#ifndef dimensionedScalar_i
#define dimensionedScalar_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.dimensionedTypes.dimensionedScalar";
%{
  #include "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedType.i"

%import "Foam/src/OpenFOAM/primitives/scalar.i"

%import "Foam/src/OpenFOAM/primitives/vector.i"

%ignore Foam::dimensioned< Foam::scalar >::component;
%ignore Foam::dimensioned< Foam::scalar >::replace;
%ignore Foam::dimensioned< Foam::scalar >::T;


//----------------------------------------------------------------------------
PYAPPEND_RETURN_SELF_COMPOUND_OPERATOR_TEMPLATE_1(Foam::dimensioned, Foam::scalar, operator+= )


//----------------------------------------------------------------------------
%typedef Foam::dimensioned< Foam::scalar > dimensionedScalar;

%typemap( out ) Foam::dimensioned< Foam::scalar >
{
  $result = SWIG_NewPointerObj( ( new $1_type( *&$1 ) ), $&1_descriptor, SWIG_POINTER_OWN |  0 );
}

%template( dimensionedScalar ) Foam::dimensioned< Foam::scalar >; 

%include <dimensionedScalar.H>


//--------------------------------------------------
%import "Foam/src/try_reverse_operator.hxx"

%feature ( "pythonprepend" ) Foam::dimensioned< Foam::scalar >::TRY_REVERSE_PYPREPEND( mul );

%feature ( "pythonprepend" ) Foam::dimensioned< Foam::scalar >::TRY_REVERSE_PYPREPEND( add );

%feature ( "pythonprepend" ) Foam::dimensioned< Foam::scalar >::TRY_REVERSE_PYPREPEND( div );

%feature ( "pythonprepend" ) Foam::dimensioned< Foam::scalar >::TRY_REVERSE_PYPREPEND( sub );

DIMENSIONEDTYPE_ADDONS( Foam::scalar )

%extend Foam::dimensioned< Foam::scalar >
{
  Foam::dimensioned< Foam::scalar > sqrt()
  {
    return Foam::sqrt( *self );
  }
  Foam::dimensioned< Foam::vector > __rmul__( const Foam::vector& ds )
  {
    return ds * *self;
  }
}


//-----------------------------------------------------------------------------
CLEAR_PYAPPEND_RETURN_SELF_COMPOUND_OPERATOR_TEMPLATE_1(Foam::dimensioned, Foam::scalar, operator+= );


//---------------------------------------------------------------------------
#endif
