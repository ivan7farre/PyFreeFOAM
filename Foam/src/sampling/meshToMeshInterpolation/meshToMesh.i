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
#ifndef meshToMesh_i
#define meshToMesh_i


//---------------------------------------------------------------------------
%module "Foam.src.sampling.meshToMeshInterpolation.meshToMesh";
%{
  #include "Foam/src/sampling/meshToMeshInterpolation/meshToMesh.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"

%import "Foam/src/finiteVolume/fvMesh/fvMeshes.i"

%import "Foam/src/OpenFOAM/primitives/Lists/wordList.i"

%import "Foam/src/OpenFOAM/containers/HashTables/HashTable/HashTable_word_word_string_hash.i"

%include <meshToMesh.H>

%define MESHTOMESH_ADDONS( Type )
{
  //- Map field
  void mapField( Field< Type >& toF,
                 const Field< Type >& fromVf,
                 const labelList& adr ) const
  {
    self->mapField( toF, fromVf, adr );
  }

  //- Interpolate field using inverse-distance weights
  void interpolateField( Field< Type >& toF,
                         const GeometricField< Type, fvPatchField, volMesh >& fromVf,
                         const labelList& adr,
                         const scalarListList& weights ) const
  {
    self->interpolateField( toF, fromVf, adr, weights );
  }

  //- Interpolate field using cell-point interpolation
  void interpolateField( Field< Type >& toF,
                         const GeometricField< Type, fvPatchField, volMesh >& fromVf,
                         const labelList& adr,
                         const vectorField& centres ) const
  {
    self->interpolateField( toF, fromVf, adr, centres );
  }

  //- Interpolate internal volume field
  void interpolateInternalField( Field< Type >& toF,
                                 const GeometricField< Type, fvPatchField, volMesh >& fromVf,
                                 meshToMesh::order ord = meshToMesh::INTERPOLATE ) const
  {
    self->interpolateInternalField( toF, fromVf, ord );
  }

  //- Interpolate volume field
  void interpolate( GeometricField< Type, fvPatchField, volMesh >& toF,
                    const GeometricField< Type, fvPatchField, volMesh >& fromVf,
                    meshToMesh::order ord = meshToMesh::INTERPOLATE ) const
  {
    self->interpolate( toF, fromVf, ord );
  }

  //- Interpolate volume field
  tmp< GeometricField< Type, fvPatchField, volMesh > > 
  interpolate( const GeometricField< Type, fvPatchField, volMesh >& fromVf,
               meshToMesh::order ord = meshToMesh::INTERPOLATE ) const
  {
    return self->interpolate( fromVf, ord );
  }
}
%enddef

%extend Foam::meshToMesh MESHTOMESH_ADDONS( Foam::scalar );

%extend Foam::meshToMesh MESHTOMESH_ADDONS( Foam::vector );


//--------------------------------------------------------------------------------------
#endif
