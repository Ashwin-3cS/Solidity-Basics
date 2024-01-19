//SPDX-License-Identifier:MIT

pragma solidity ^ 0.8.8;

contract FallbackExample{
    uint256  public result ;


    receive() external payable {
        result=1;
    } 

    fallback()external payable {
        result =2;
    }
}    // if data is sended along with the transaction it will trigger the fallback() if not transaction takes place without no data also sended along with it then ,it will trigger the receive()
