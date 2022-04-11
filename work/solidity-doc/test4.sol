// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MyNft{
    function balanceOf(uint _a) public pure virtual returns(uint){
        return _a + 2;
    }
}

contract MyToken{
    function balanceOf(uint _a) public pure virtual returns(uint){
        return _a + 5;
    }
}

contract buy is MyToken,MyNft{
    function balanceOf(uint _a) public pure override(MyToken, MyNft) returns(uint){
        return MyToken.balanceOf(_a);
    }

    uint public A = MyToken.balanceOf(200);
    uint public B = MyNft.balanceOf(200);
    uint public C = super.balanceOf(500);
}