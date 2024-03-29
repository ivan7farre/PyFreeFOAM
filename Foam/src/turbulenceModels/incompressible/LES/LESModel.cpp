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
%{
  #include "Foam/src/turbulenceModels/incompressible/LES/LESModel.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

#if FOAM_VERSION( <, 010500 )
#define incompressibleLESModel_cpp
#endif


//-----------------------------------------------------------------------------
#ifndef incompressibleLESModel_cpp
#define incompressibleLESModel_cpp


//----------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/fields/tmp/autoPtr_incompressible_turbulenceModel.i"

// #include "LESdelta.H"
// #include "fvm.H"
// #include "fvc.H"

%import "Foam/src/finiteVolume/fvMatrices/fvMatrices.i"

%import "Foam/src/transportModels/incompressible/transportModel.i"

// #include "wallFvPatch.H"

%import "Foam/src/finiteVolume/cfdTools/general/bound.i"

%import "Foam/src/OpenFOAM/fields/tmp/autoPtr.i"

// #include "runTimeSelectionTables.H"

%import "Foam/src/OpenFOAM/db/IOdictionary.i"


//----------------------------------------------------------------------------
%rename( incompressible_LESModel ) Foam::incompressible::LESModel;

#if FOAM_NOT_BRANCH( __FREEFOAM__ )
%include <incompressible/LESModel.H>
#else
%include <incompressibleLESModels/LESModel.H>
#endif


//---------------------------------------------------------------------------
#endif
