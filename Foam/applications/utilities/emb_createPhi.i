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
//  Author : Ivor CLIFFORD


//---------------------------------------------------------------------------
#ifndef emb_createPhi_i
#define emb_createPhi_i


//---------------------------------------------------------------------------
%{
  #include "Foam/applications/utilities/emb_createPhi.hh"
%}


%import "src/finiteVolume/fvMesh/fvMeshes.i"

%typemap( out ) Foam::surfaceScalarField
{
    $result = SWIG_NewPointerObj( ( new $1_type( *&$1 ) ), $&1_descriptor, SWIG_POINTER_OWN |  0 );
}


//---------------------------------------------------------------------------
%inline
%{
    #include "linear.H"

    namespace Foam
    {
        //- Global function for flux creation
        surfaceScalarField execute( const volVectorField& U )
        {
            return surfaceScalarField
                (
                    IOobject
                    (
                        "phi",
                        U.db().time().timeName(),
                        U.mesh(),
                        IOobject::READ_IF_PRESENT,
                        IOobject::AUTO_WRITE
                        ),
                    linearInterpolate(U) & U.mesh().Sf()
                    );
        }
    }
%}


//---------------------------------------------------------------------------
#endif
