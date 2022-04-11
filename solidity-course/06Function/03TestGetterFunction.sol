//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract testGetterFunction{
    uint a = 5;
}


contract test{
    function test() public  returns(uint){
        testGetterFunction tf = new testGetterFunction;
        uint b = tf.a();
        return b;
    }
}