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
#ifndef calculatedFvPatchField_scalar_i
#define calculatedFvPatchField_scalar_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.fields.fvPatchFields.basic.calculated.calculatedFvPatchField_scalar"
%{
    #include "Foam/src/finiteVolume/fields/fvPatchFields/basic/calculated/calculatedFvPatchField_scalar.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/finiteVolume/fields/fvPatchFields/basic/calculated/calculatedFvPatchField.i"

%inline
{
  namespace Foam 
  {
    typedef calculatedFvPatchField< scalar > calculatedFvPatchScalarField;
  }
}

%template ( calculatedFvPatchField_scalar ) Foam::calculatedFvPatchField< Foam::scalar >;


//----------------------------------------------------------------------------
#endif
