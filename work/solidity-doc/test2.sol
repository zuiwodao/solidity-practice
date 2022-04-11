//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract test{
    function test1() public pure returns(int a,int k){
        int k = 0;
        int a = k--;
        return (a,k);
    }
}