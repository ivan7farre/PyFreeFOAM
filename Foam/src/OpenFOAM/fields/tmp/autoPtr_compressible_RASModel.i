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
%module "Foam.src.OpenFOAM.fields.tmp.autoPtr_compressible_RASModel"
%{
  #include "Foam/src/OpenFOAM/fields/tmp/autoPtr_compressible_RASModel.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

#if FOAM_VERSION( <, 010500 )
#define autoPtr_compressible_RASModel_i
#endif


//-----------------------------------------------------------------------------
#ifndef autoPtr_compressible_RASModel_i
#define autoPtr_compressible_RASModel_i


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/autoPtr.i"

%include "Foam/src/turbulenceModels/compressible/RAS/RASModel.cpp"


//----------------------------------------------------------------------------
AUTOPTR_TYPEMAP( Foam::compressible::RASModel )

%ignore Foam::autoPtr< Foam::compressible::RASModel >::operator->;

%template( autoPtr_compressible_RASModel ) Foam::autoPtr< Foam::compressible::RASModel >;


//------------------------------------------------------------------------------
%feature( "pythonappend" ) Foam::autoPtr< Foam::compressible::RASModel >::SMARTPTR_PYAPPEND_GETATTR( autoPtr_compressible_RASModel );

%extend Foam::autoPtr< Foam::compressible::RASModel >
{
  SMARTPTR_EXTEND_ATTR( autoPtr_compressible_RASModel );
}

//---------------------------------------------------------------------------
#endif
