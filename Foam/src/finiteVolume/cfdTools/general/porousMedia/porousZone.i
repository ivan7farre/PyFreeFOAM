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
#ifndef porousZone_i
#define porousZone_i


//---------------------------------------------------------------------------
%module "Foam.src.finiteVolume.cfdTools.general.porousMedia.porousZone";
%{
  #include "Foam/src/finiteVolume/cfdTools/general/porousMedia/porousZone.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/db/dictionary/dictionary.i"

%import "Foam/src/meshTools/coordinateSystems/coordinateSystem.i"

%import "Foam/src/meshTools/coordinateSystems/coordinateSystems.i"

%import "Foam/src/OpenFOAM/primitives/Lists/wordList.i"

%import "Foam/src/OpenFOAM/primitives/Lists/labelList.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedScalar.i"

%import "Foam/src/OpenFOAM/dimensionedTypes/dimensionedTensor.i"

%import "Foam/src/OpenFOAM/fields/Fields/primitiveFieldsFwd.i"

%import "Foam/src/finiteVolume/fvMatrices/fvMatrices.i"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%include <porousZone.H>


//---------------------------------------------------------------------------
#endif
