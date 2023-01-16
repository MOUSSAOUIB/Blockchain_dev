// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


error notOwner();

import "./PriceConvertor.sol";

contract Fundme  {

    address public owner;

     constructor (){
         owner = msg.sender;
     }
    using PriceConvertor for uint256;

    // Add all addresses fund the contract to a single variable "funders"
    address[] public funders;
    //minimum usd converted to wei
    // to convert https://eth-converter.com/
    uint256 public  minimumUsd = 50*1e18;
    mapping ( address => uint256) public addressToAmountFounded;
    function fund () public payable{
        
        // A minimum aount  of 1 ether is required, to fund the smart contract 
        require(msg.value.getConversionRate() >= minimumUsd, "not enough");
        
        addressToAmountFounded[msg.sender] += msg.value;
        funders.push(msg.sender);


    }

   modifier onlyowner{

       //require(msg.sender == owner, "not the owner");

       if (msg.sender!= owner){ revert notOwner();}
       _;

   }
    

    function withdraw() public onlyowner{

        for ( uint256 i=0; i< funders.length;i++)
        {
            address funder = funders[i];
            addressToAmountFounded[funder]=0;
        }

        funders = new address[](0);

     (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    uint256 public receive_fullbackTest;
    receive() external payable { receive_fullbackTest =1; }

    fallback() external payable { receive_fullbackTest =2; }

}