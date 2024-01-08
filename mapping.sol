//SPDX-License-Identifier:MIT

pragma  solidity ^ 0.8.8;

contract maptest{
    struct  favTeller{
        string name;
        uint256 favNum;
    }

    favTeller[] public favteller;

    mapping (string => uint256) public NametoFavnum;
    
    function addDetails(string memory _name,uint256 _favNum)public{
        
        favteller.push(favTeller({name:_name,favNum:_favNum}));
        NametoFavnum[_name]=_favNum;

    }
}

