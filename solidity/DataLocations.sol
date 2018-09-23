pragma solidity ^0.4.0;
contract ReferenceTypesSample {
    uint[] storageArray; //#A        
    function f(uint[] fArray) { //#B
        uint[] localArray1 = storageArray; //#E
        uint[] localArray2 = fArray; //#F
        storageArray= fArray; //#G        
        g(storageArray); //#H
        h(storageArray); //#I
    }

    function g(uint[] storage gArray) internal {} //#C

    function h(uint[] memory hArray) internal {} //#D
}

//#A The data location of storageArray is implicitly defined as storage

//#B The data location of fArray implicitly defined as memory

//#C The data location of gArray explicitly defined as storage

//#D The data location of hArray explicitly defined as memory

//#E localArray1 is defined implicitly on the storage and it points directly to storageArray. If localArray is modified, storageArray is consequently modified

//#F fArray is implicitly defined in memory. localArray2 is defined in memory and it points directly to fArray. If localArray is modified, fArray is consequently modified.

//#G fArray is implicitly defined in memory, storageArray stores on storage a full copy of fArray.

//#H If you pass a state variable to a function parameter defined in storage, the state variable is referenced directly by the function parameter

//#I If you pass a state variable to a function parameter defined in memory the function parameter creates a local clone of the state variable