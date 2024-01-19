//SPDX-License-Identifier:MIT
pragma solidity ^ 0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;


    uint256 public minimumUsd=  50 * 1e18; //Solidity basically has problem handling Decimals , in conversion rate function it gives the opwith 18 decimals make sure you have 18 decimals equally everywhere
    // This line declares a public variable minimumUsd of type uint256 and initializes it with the value of 50 Ether converted to Wei (Wei is the smallest unit of Ether, and 1e18 represents 1 Ether in Wei). This variable represents the minimum amount of Ether in USD required for funding.
    address[] public funders;
    mapping( address => uint256 )public addressToAmountFunded;
    
    address public owner;

    //using constructor
    constructor(){
        owner=msg.sender;
    }

    function fund()public payable {
        require(msg.value.getConversionRate()>=minimumUsd,"did'nt send enough eth");
        //msg.value is taken as input in the function getconversion rate (ethAmount)

        //1eth = 1000000000000000000 (18 decimal places)
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=msg.value;
    }

    function withdraw() public onlyOwner {
        //check whether owner is withdraing ,if not throws an error owner is the one who deploys the contract
        // what if we have requirements that more than one person is a owner and they should withdraw here comes modifier 

        /*require(msg.sender==owner, "Sender is not owner"); */


        //for loop 
        //[1,2,3,4] using indexing 
        //syntax
        //for(starting index , ending index , step amount )
        for(uint256 funderIndex=0;funderIndex < funders.length;funderIndex=funderIndex+1 /* or we can use this for incrementation   funderIndex++ */){

            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0;

        }

        //reset the array
        funders = new  address[](0); //completly new address Array without any object ; completly starting as a complete new blank array

        //sending currency to contracts from each other

        //transfer //these are three different ways to send native currency 
        //send
        //call

        //transfer 

        //msg.sender=address
        //payable(msg.sender)=payable address // only this is used for paying currency
       payable (msg.sender).transfer(address(this).balance);// if it fails it will revert the transaction 

       //send
       bool sendSuccess=payable(msg.sender).send(address(this).balance);
        require (sendSuccess,"SEnd Failed");// using send keyword we can send the whole balance ;if it succeeds okay; if not we can see a message "send failed" returns a boolean or the string that we tell it to display if the conditon doesnt satisfy 
        //call its powerfull 
       (bool callSuccess , )=payable(msg.sender).call{value:address(this).balance}("");/* the function that i need to get called can be entered */ 
        require (callSuccess,"call Failed");
  //callmethod is the very used part 





    }

    modifier onlyOwner{
        require(msg.sender==owner,"sender is not owner!");
        _; // this :_ tells that first check the require then check the code in withdraw function; if you see in withdraw function we have used the onlyOwner modifier ; first it checks the require then the code; if the _: is at top then the code will be checked first then the require statement
    }


    receive () external payable {
        fund();
    }

    fallback()external payable {
        fund();
    }

    // if data is sended along with the transaction it will trigger the fallback() if not transaction takes place without no data also sended along with it then ,it will trigger the receive()
    
    }
