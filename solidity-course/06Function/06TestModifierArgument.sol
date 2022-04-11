//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestModifierArgument{
    uint public level = 0;
    string public name = "0" ;
    string public skinColor;

    modifier levelRequire(uint _level){
        require (level > _level);
        _;
    }
    function setName() public levelRequire(5){
            name = "Nico";
        
    }

    function setSkinColor() public levelRequire(10){
        skinColor = "red";
    }

    function setLevel(uint _level) public  {
        level = _level;
    }
}