//SPDX-License-Identifier: MIT

//contracts interacting with other contracts. Importing Contracts into other Contracts

pragma solidity ^0.8.0;

import"./SimpleStorage.sol"; //With this we are like copying the code in here, but this way we just import it directly and faster.

contract StorageFactory{ //until we dont click on StorageFactory button, the contract SimpleStorage won't be called, and by default it'll be 0x0000000...
    SimpleStorage[] public simpleStorageArray; //we create a global variable called simpleStorage, SimpleStorage contract will be called by the glob variable simpleStorage
    
    function createSimpleStorageContract () public { //public so everyone can deploy it.
        SimpleStorage simpleStorage = new SimpleStorage(); //this is how solidity knows ww are deploying a new contract 
        simpleStorageArray.push(simpleStorage); //now, we have the positoin 0 for the first contract deployed, the position 1 for the second one.
    
    }              //if we dont do it as arrays, everytime we call it, it will replace the simplestorage public variable, if we do it array, we can  have contorl of all of the deploye dcontracts.


    //&&&&&&&&&&&&&&&&&&&&&&& INTERACTING WITH OTHER CONTRACTS &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // we will need the address and ABI of the contracts
        //
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();        
    }
}
