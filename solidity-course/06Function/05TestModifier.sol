//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestModifier{
    uint public a;
    modifier myModifier(){
        a = 3;
        _;
        a = 9;
    }
    function testModifier() public  myModifier returns(uint){
        return a = 8;

    }
}