// We delete everything else in the folders, and we add SimpleStorage.sol to the contracts folder.
// I'm a comment!
//SPDX-License-Identifier: MIT  


// always need to add which version of solidity compiler we use
//pragma_solidity ^0.8.0;  this is for versions 0.8 or above
//pragma_solidity >=0.8.0 <0.9.0; and this is for versions between these 2.
//we had to add the _ beacuse it was generating problems compiling

pragma solidity ^0.8.0;

contract SimpleStorage { //To create a contract within {}
//ALWAYS SPECIFY THE TYPE OF VARIABLE WHEN DEFINING IT.
//SOLID has 4 tpyes of Vars, bools, uint(positives integ) int(pos or neg integer), address and bytes.
//uint256 or int256 to have the max bytes possible.
//The default value of a int is 0, in Solidity.
    uint favoriteNumber = 16;  //If i dont equal to a number, by default it will be 0.
    //we made favoriteNumber public to see the result when we deploy the contract


    //ANY CHANGE WE MAKE, WE NEED TO RECOMPILE IT
    //TO DEPLOY IT TO THE BLOCKCHAIN, WE CLICK ON THE LAST OPTION ON THE LEFT (ETHER ICON WITH AN ARROW)
    //WE USE ENVIRONMNET JAVASCRIPT VM LONDON
    // ON CONTRACT WE SELECT WHICH ONE WE WANT TO DEPLOY
    // BELOW WE WILL SE DEPLOYED CONTRACTS, AND WE COULD INTERACT WITH IT. FOR EVERY CONTRACT WE'LL HAVE A DIRECTION
    // DEPLOYING OR INTERACTING WITH A CONTRACT IS MODIFIYING THE STATE OF THE BLOCKCHAIN, THEREFORE WE HAVE TO PAY THE GAS

    //Create a function that changes the value of the var favoriteNumber to some new value.
    function store(uint256 _favoriteNumber) public virtual {  //define new var calles _favoriteNumber VIRTUAL IS FOR EXTRASTORAGE.SOL
        favoriteNumber = _favoriteNumber;
        //retrieve(); // THIS COSTS GAS, because this function is gas consuming(it is on chain) and is calling a view function (is free) but it will take a cost to call it in this gas function.
    }
    //private a variable is making it only visible in the current contract used.
    //as the functions gets "longer", the amount of gas will increase proportionally.

    //we could create a function to return the value of favoriteNumber without having to make it a public variable
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //pure doesnt allow to modify the state of the blockahin, nor read from the blockchain, we couldnt read favoriteNumber if we had used pure instead of view.
    //using the comand view in a function means we are only reading the state of something on the contract.
    //we don't change any state on the blockchain, therefore, it is free gas, it is only to read data of the contract
    //if a gas calling function calls a view/pure function, it will cost gast, since it is onchain, for example, if we were calling retrieve() in store function, it will cost gas.


//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

//ARRAYS & STRUCTURES
//%%%%%%%%%%%%%%%%%%%%

    //Let's create an structure of people:
    struct People{
        uint256 favoriteNumber;
        string name;
    }
    //To save people within, we will create an array of people.
    People[] public people;
    // people 0 is the 1st data in the array, and so on..., like accessing the position)

//MAPPING
    mapping(string => uint256) public nameToFavoriteNumber; //we are mapping a string to a uint256 variable, called favorite number. Is a data structure which a key is mapped to a single value. AS A DICTIONARY

    //Let's create a function to add people to the structure
    function addPerson (string memory _name, uint256 _favoriteNumber) public {  //the inputs of the functions a string (alocated in memory) and a uint256
        People memory newPerson = People({favoriteNumber:_favoriteNumber, name: _name}); //How to add a new person to the people array. People(uint256,stirng) LINE 52
        people.push(newPerson); //push is the same as add 
        nameToFavoriteNumber[_name] = _favoriteNumber; //we are mapping a string to a uint256 variable, called favorite number.In this case, we ask the name of the person and then we get the fav number assigned
    }
    // memory is used here to specify where the varible is stored in the 'transaction' 
    // we could use calldata, but we couldnt change the variable value, if we use memory, we can change it.
    // for strings,maps and arrays we may need to specify where they are alocated, since they are an array of bits.

//TO DEPLOY IT TO A TEST NEW, WE CHANGE THE ENVIRONMENT TO INJECTED PROVIDER - METAMASK

}
