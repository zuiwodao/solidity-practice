//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract Father{
    uint money = 10000;
    function getMoney() public pure virtual returns(uint){
        return 10000;
    } 
}


contract Mother{
   // uint money = 8000;
    function getMoney() public pure virtual returns(uint){
        return 8000;
    }
}

contract sun is Father,Mother{
    function getMoney() public pure override(Father,Mother) returns(uint){
          return Father.getMoney() + Mother.getMoney();
    }
}