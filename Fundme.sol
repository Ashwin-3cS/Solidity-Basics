//SPDX-License-Identifier:MIT
pragma solidity 0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;


    uint256 public minimumUsd=  50 * 1e18; //Solidity basically has problem handling Decimals , in conversion rate function it gives the opwith 18 decimals make sure you have 18 decimals equally everywhere
    // This line declares a public variable minimumUsd of type uint256 and initializes it with the value of 50 Ether converted to Wei (Wei is the smallest unit of Ether, and 1e18 represents 1 Ether in Wei). This variable represents the minimum amount of Ether in USD required for funding.
    address[] public funders;
    mapping( address => uint256 )public addressToAmountFunded;

    function fund()public payable {
        require(msg.value.getConversionRate()>=minimumUsd,"did'nt send enough eth");
        //msg.value is taken as input in the function getconversion rate (ethAmount)

        //1eth = 1000000000000000000 (18 decimal places)
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=msg.value;
    }

    
    }
