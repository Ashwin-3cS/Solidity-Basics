//SPDX-License-Identifier:MIT

pragma solidity ^ 0.8.8;

contract favTeller{
    uint256 usn;
    string clgName;
    string studentName;
    
    struct Friends{
        uint256 favnum;
        string name;
        string food;
    }


    Friends[] public friends;//friends is an array of  Friends(i.e) struct 

    function addDetails(uint256 _favNum, string memory _name,string memory _food) public{
        
        friends.push(Friends({favnum: _favNum, name: _name, food: _food}));

    }



// Just more practise no relation with the above arrays and struct code , but the variables are declared globally above the  structure.
    function store(uint256 _enterusnNum ,  string memory _enterclgName,string memory _enterstudentName) public{
        usn=_enterusnNum;
        clgName= _enterclgName;
        studentName=_enterstudentName;
    }

    function showTheNum()public view returns(uint256){
        return usn;
    }
    function showTheclgName()public view returns (string memory){
        return clgName;
    }
    function showTheName() public view returns (string memory ){
        return studentName;
    }
}