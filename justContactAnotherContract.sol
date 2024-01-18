////SPDX-License-Identifier:MIT

pragma solidity  ^ 0.8.8;

import "./mapping.sol";

contract callMapping{

    maptest[] public MaptestArray;



    function callMap()public{
      maptest MapstorageVar=new maptest();
      MaptestArray.push(MapstorageVar);

    }


}
