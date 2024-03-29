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
#ifndef IOstream_i
#define IOstream_i


//---------------------------------------------------------------------------
%module "Foam.src.OpenFOAM.db.IOstreams.IOstreams.IOstream";
%{
   #include "Foam/src/OpenFOAM/db/IOstreams/IOstreams/IOstream.hh"
%}


//---------------------------------------------------------------------------
%import "Foam/src/common.hxx"


//---------------------------------------------------------------------------
// Workaround for the nested class wrapping
%feature( "valuewrapper" ) Foam::IOstream::versionNumber; // Don't use default constructor
namespace Foam
{
  struct versionNumber
  {
    versionNumber( const Foam::scalar num );
  };
}


//---------------------------------------------------------------------------
%rename( ext_print ) Foam::IOstream::print;

%include <IOstream.H>


//---------------------------------------------------------------------------
%inline
%{
  namespace Foam
  {
    typedef IOstream::versionNumber versionNumber;
  }
%}

%typemap( out ) Foam::IOstream::versionNumber
{
  $result = SWIG_NewPointerObj( ( new $1_type( *&$1 ) ), $descriptor( Foam::versionNumber* ), SWIG_POINTER_OWN |  0 );
}


//---------------------------------------------------------------------------
#endif
