

// pragma solidity ^ 0.6.0;
 

//  contract SafeMathTester{
//     uint8 public bigNumber =255; //unchecked because the version of pragma is too low 
//     function add()public{
//         bigNumber=bigNumber+1;
//     }
//  }



//SPDX-License-Identifier:MIT

pragma solidity ^ 0.8.0;

contract SafeMathTester{
     uint8 public bigNumber =255; //checked because  because the version of pragma is updated ^8.0
     function add()public{
         bigNumber=bigNumber+1; //it will not proceed to do this since its updated 

    }
    function addWithUncheckedKeyword()public{
        unchecked{ bigNumber=bigNumber+1;}// this makes  gas  efficient 
    }
}
