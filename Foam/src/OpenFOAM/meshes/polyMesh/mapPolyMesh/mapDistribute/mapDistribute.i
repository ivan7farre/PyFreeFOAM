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
%module "Foam.src.OpenFOAM.meshes.polyMesh.mapPolyMesh.mapDistribute.mapDistribute"
%{
  #include "Foam/src/OpenFOAM/meshes/polyMesh/mapPolyMesh/mapDistribute/mapDistribute.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

#if FOAM_VERSION( <, 010600 )
#define mapDistribute_i
#endif


//---------------------------------------------------------------------------
#ifndef mapDistribute_i
#define mapDistribute_i


//---------------------------------------------------------------------------
%import "Foam/src/OpenFOAM/primitives/Lists/labelList.i"

%import "Foam/src/OpenFOAM/primitives/Lists/scalarList.i"

%import "Foam/src/OpenFOAM/primitives/Pair/labelPair.i"

%import "Foam/src/OpenFOAM/db/IOstreams/Pstreams/Pstream.i"

%import "Foam/src/OpenFOAM/primitives/Lists/boolList.i"

%include <mapDistribute.H>


//---------------------------------------------------------------------------
%extend Foam::mapDistribute
{
  static void distribute( const Pstream::commsTypes commsType, 
			  const List<labelPair>& schedule, 
			  const label constructSize, 
			  const labelListList& subMap,
			  const labelListList& constructMap,
			  List<scalar>& field )
  {
      return Foam::mapDistribute::distribute( commsType, 
					      schedule, 
					      constructSize, 
					      subMap, 
					      constructMap, 
					      field );
  }
}


//---------------------------------------------------------------------------
#endif
