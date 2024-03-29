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
#ifndef findRefCell_i
#define findRefCell_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.cfdTools.general.findRefCell";
%{
  #include "Foam/src/finiteVolume/cfdTools/general/findRefCell.hh"
%}


//-------------------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/label.i"

%import "Foam/src/OpenFOAM/primitives/scalar.i"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"


//--------------------------------------------------------------------------------------
%inline
{
  namespace Foam
  {
    struct t_setRefCell
    {
      label m_refCelli;
      scalar m_refValue;
      t_setRefCell( label the_refCelli, scalar the_refValue )
        : m_refCelli( the_refCelli )
        , m_refValue( the_refValue )
      {}
    };
  }
}


//--------------------------------------------------------------------------------------

%inline
{

#if FOAM_VERSION( <, 010500 ) || FOAM_REF_VERSION( ==, 010500 ) 
  Foam::t_setRefCell ext_setRefCell( const Foam::volScalarField& field,
                                     const Foam::dictionary& dict,
                                     Foam::label refCelli,
                                     Foam::scalar refValue )
  {
    Foam::setRefCell( field, dict, refCelli, refValue );
    return t_setRefCell( refCelli, refValue );
  }                    
#endif

//----------------------------------
#if FOAM_VERSION( >=, 010600 ) || FOAM_BRANCH_VERSION( __OPENFOAM_EXT__, >=, 010500 )
  Foam::t_setRefCell ext_setRefCell( const Foam::volScalarField& field,
                                     const Foam::dictionary& dict,
                                     Foam::label refCelli,
                                     Foam::scalar refValue,
                                     const bool forceReference = false )
  {
    Foam::setRefCell( field, dict, refCelli, refValue, forceReference);
    return t_setRefCell( refCelli, refValue );
  }
#endif


//----------------------------------
#if FOAM_VERSION( >=, 010700 )
  Foam::t_setRefCell ext_setRefCell( const Foam::volScalarField& field,
                                     const Foam::volScalarField& fieldRef,
                                     const Foam::dictionary& dict,
                                     Foam::label refCelli,
                                     Foam::scalar refValue,
                                     const bool forceReference=false )
  {
    Foam::setRefCell( field, fieldRef, dict, refCelli, refValue, forceReference );
    return t_setRefCell( refCelli, refValue );
  }
#endif
}


//---------------------------------------------------------------------------
#if  FOAM_VERSION( >=, 010600 ) || FOAM_BRANCH_VERSION( __OPENFOAM_EXT__, >=, 010500 )
  Foam::scalar getRefCellValue( const Foam::volScalarField& field, const Foam::label refCelli );
#endif


//---------------------------------------------------------------------------
#endif
