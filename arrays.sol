//SPDX-License-Identifier:MIT

pragma solidity ^ 0.8.8;

contract favTeller{
    
    struct Friends{
        uint256 favnum;
        string name;
        string food;
    }


    Friends[] public friends;//friends is an array of  Friends(i.e) struct 

    function addDetails(uint256 _favNum, string memory _name,string memory _food) public{
        
        friends.push(Friends({favnum: _favNum, name: _name, food: _food}));

    }
}

























    // function store(uint256 _enterFavnum ,  string memory _enterName,string memory _enterFood) public{
    //     favNum=_enterFavnum;
    //     Name= _enterName;
    //     Food=_enterFood;


    // }

    // function showTheNum()public view returns(uint256){
    //     return favNum;
    // }
    // function showTheName()public view returns (string memory){
    //     return Name;
    // }
    // function showTheFood() public view returns (string memory ){
    //     return Food;
    // }
// }