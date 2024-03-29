/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     |
    \\  /    A nd           | Copyright (C) 1991-2009 OpenCFD Ltd.
     \\/     M anipulation  |
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM; if not, write to the Free Software Foundation,
    Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

Class
    Foam::DynamicList

Description
    A 1D vector of objects of type \<T\> that resizes itself as necessary to
    accept the new objects.

    Internal storage is a compact array and the list can be shrunk to compact
    storage. The increase of list size is controlled by three template
    parameters, which allows the list storage to either increase by the given
    increment or by the given multiplier and divider (allowing non-integer
    multiples).

SourceFiles
    DynamicListI.H
    DynamicList.C

\*---------------------------------------------------------------------------*/

#ifndef DynamicList_H
#define DynamicList_H

#include "OpenFOAM/List.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

namespace Foam
{

// Forward declaration of friend functions and operators

template<class T, unsigned SizeInc, unsigned SizeMult, unsigned SizeDiv>
class DynamicList;

template<class T, unsigned SizeInc, unsigned SizeMult, unsigned SizeDiv>
Ostream& operator<<
(
    Ostream&,
    const DynamicList<T, SizeInc, SizeMult, SizeDiv>&
);
template<class T, unsigned SizeInc, unsigned SizeMult, unsigned SizeDiv>
Istream& operator>>
(
    Istream&,
    DynamicList<T, SizeInc, SizeMult, SizeDiv>&
);


/*---------------------------------------------------------------------------*\
                           Class DynamicList Declaration
\*---------------------------------------------------------------------------*/

template<class T, unsigned SizeInc=0, unsigned SizeMult=2, unsigned SizeDiv=1>
class DynamicList
:
    public List<T>
{
    // Private data

        //- The capacity (allocated size) of the underlying list.
        label capacity_;

    // Private Member Functions

public:

    // Related types

        //- Declare friendship with the List class
        friend class List<T>;

    // Constructors

        //- Construct null
        inline DynamicList();

        //- Construct given size.
        explicit inline DynamicList(const label);

        //- Construct copy.
        explicit inline DynamicList
        (
            const DynamicList<T, SizeInc, SizeMult, SizeDiv>&
        );

        //- Construct from UList. Size set to UList size.
        //  Also constructs from DynamicList with different sizing parameters.
        explicit inline DynamicList(const UList<T>&);

        //- Construct from UIndirectList. Size set to UIndirectList size.
        explicit inline DynamicList(const UIndirectList<T>&);

        //- Construct by transferring the parameter contents
        explicit inline DynamicList(const Xfer< List<T> >&);

        //- Construct from Istream. Size set to size of read list.
        explicit DynamicList(Istream&);


    // Member Functions

        // Access

        //- Size of the underlying storage.
        inline label capacity() const;

        // Edit

        //- Alter the size of the underlying storage.
        //  The addressed size will be truncated if needed to fit, but will
        //  remain otherwise untouched.
        //  Use this or reserve() in combination with append().
        inline void setCapacity(const label);

        //- Alter the addressed list size.
        //  New space will be allocated if required.
        //  Use this to resize the list prior to using the operator[] for
        //  setting values (as per List usage).
        inline void setSize(const label);

        //- Alter the addressed list size and fill new space with a constant.
        inline void setSize(const label, const T&);

        //- Alter the addressed list size.
        //  New space will be allocated if required.
        //  Use this to resize the list prior to using the operator[] for
        //  setting values (as per List usage).
        inline void resize(const label);

        //- Alter the addressed list size and fill new space with a constant.
        inline void resize(const label, const T&);

        //- Reserve allocation space for at least this size.
        //  Never shrinks the allocated size, use setCapacity() for that.
        inline void reserve(const label);

        //- Clear the addressed list, i.e. set the size to zero.
        //  Allocated size does not change
        inline void clear();

        //- Clear the list and delete storage.
        inline void clearStorage();

        //- Shrink the allocated space to the number of elements used.
        //  Returns a reference to the DynamicList.
        inline DynamicList<T, SizeInc, SizeMult, SizeDiv>& shrink();

        //- Transfer contents of the argument List into this DynamicList
        inline void transfer(List<T>&);

        //- Transfer contents of the argument DynamicList into this DynamicList
        inline void transfer(DynamicList<T, SizeInc, SizeMult, SizeDiv>&);

        //- Transfer contents to the Xfer container as a plain List
        inline Xfer< List<T> > xfer();

    // Member Operators

        //- Append an element at the end of the list
        inline void append(const T&);

        //- Append a List at the end of this list
        inline void append(const UList<T>&);

        //- Append a UIndirectList at the end of this list
        inline void append(const UIndirectList<T>&);

        //- Remove and return the top element
        inline T remove();

        //- Return non-const access to an element, resizing list if necessary
        inline T& operator()(const label);

        //- Assignment of all addressed entries to the given value
        inline void operator=(const T&);

        //- Assignment from DynamicList
        inline void operator=
        (
            const DynamicList<T, SizeInc, SizeMult, SizeDiv>&
        );

        //- Assignment from UList
        inline void operator=(const UList<T>&);

    // IOstream operators
#ifndef SWIG
        // Write DynamicList to Ostream.
        friend Ostream& operator<< <T, SizeInc, SizeMult, SizeDiv>
        (
            Ostream&,
            const DynamicList<T, SizeInc, SizeMult, SizeDiv>&
        );

        //- Read from Istream, discarding contents of existing DynamicList.
        friend Istream& operator>> <T, SizeInc, SizeMult, SizeDiv>
        (
            Istream&,
            DynamicList<T, SizeInc, SizeMult, SizeDiv>&
        );
#endif        
};


// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

} // End namespace Foam

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#include "DynamicListI.H"

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#ifdef NoRepository
#   include "DynamicList.C"
#endif

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

#endif

// ************************************************************************* //
