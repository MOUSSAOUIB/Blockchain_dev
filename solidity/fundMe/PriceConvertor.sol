// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

//Chainlink Price feeds contract
//https://docs.chain.link/data-feeds/price-feeds 
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Fundme  {
    // Add all addresses fund the contract to a single variable "funders"
    address[] public funders;
    //minimum usd converted to wei
    // to convert https://eth-converter.com/
    uint256 public  minimumUsd = 50*1e18;
    mapping ( address => uint256) public addressToAmountFounded;
    function fund () public payable{
        
        
        // A minimum aount  of 1 ether is required, to fund the smart contract 
        require( getVersionRate(msg.value) >= minimumUsd, "not enough");
        
        addressToAmountFounded[msg.sender] = msg.value;
        funders.push(msg.sender);


    }

   
    function getPrice () public view returns (uint256) {
        //Address for price feeds 
        //https://docs.chain.link/data-feeds/price-feeds/addresses
        //https://docs.chain.link/data-feeds/price-feeds
         AggregatorV3Interface priceFeeds = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
       (, int price ,,,
        ) = priceFeeds.latestRoundData();

        return uint256(price*1e10);
    }

    function getVersion () public view returns (uint256) {

        AggregatorV3Interface priceFeeds = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return priceFeeds.version();

    }

    function getVersionRate( uint256 etherAmonut) public view returns (uint256)
    {
        uint256 etherPrice = getPrice();
        uint256 etherAmountInUsd = (etherAmonut * etherPrice) / 1e18;

        return etherAmountInUsd;

    }

    function withdraw() public {

    }
}