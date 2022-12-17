// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./simplestorage.sol";

//create a contract inheritance simplestorage contract, and override functions
contract extrasimplestorage is simplestorage {


//override store function  using key work "override"

function store( uint _number) public override {
        number = _number+6;
    }


}