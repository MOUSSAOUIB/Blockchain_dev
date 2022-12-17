
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// import simplestorage contract 

import "./simplestorage.sol";

//create a contract 
contract storageFactory  {
//create a list of simplestorage contract 
simplestorage [] public simplestorageArray;

// function to create cimplestorage contracts and saved it to the list "simplestorageArray"


function createsimplestorage() public{

    //simplestorageArray.push(new simplestorage);
    simplestorage simpleStorage = new simplestorage();
        simplestorageArray.push(simpleStorage);
}

//create a function to store a number for a given "simplestorage" contract ( index known in the list)

function sfStore ( uint _index, uint _number) public {

 simplestorageArray[_index].store(_number);

}

//create a function to retreive the number value

function sfGet (uint index) public view returns (uint) {

    return simplestorageArray[index].retrieve();
}

}