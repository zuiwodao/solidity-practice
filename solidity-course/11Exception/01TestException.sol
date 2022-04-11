//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.7.0;

contract TestException{
    uint public data = 100;
    function testRequire(uint _i) public  {
        data = 200;
        require(_i > 10,"_i is < 10");
    } 

    function testAssert(uint _i) public{
        data = 300;
        assert(_i > 10);
    }

    function testRevert(uint _i) public{
        data = 400;
        if(_i < 10){
            revert("_i < 10");
        }
    }
    
    event successEvent();
    event failEvent();
    function testTry(uint _i) public {
        try this.testRevert(_i){
            emit successEvent();
        }catch{
            emit failEvent();
        }
    }
}