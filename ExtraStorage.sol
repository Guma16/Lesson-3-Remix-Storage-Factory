//SPDX-License-Identifier: MIT

//INHERITANCE

pragma solidity ^0.8.0;
//we can make this contract a child of SimpleStorage
import"./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{   //this is how to make inheritance.
    //let's say that we want to store a new fav number but adding it 5.
    //to do this we will use override function and virtual. we add virtual to the SimpleStorage.sol store function
    function store(uint256 _favoriteNumber) public override{
        favoriteNumber = _favoriteNumber + 5;
    }

}
