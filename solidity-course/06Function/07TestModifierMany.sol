//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestModifierArgument{
    uint public a = 1;
    modifier myModifier1{
        a = 3;
        _;
        a = 6;
    }

    modifier myModifier2{
        a = 4;
        _;
        a = 10;
    }

    function test() public myModifier1 myModifier2{
        
    }
}