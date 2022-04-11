//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;
//抽象函数
abstract contract Father{
    function eat() public pure virtual;
}

contract Sun is Father{
    function eat(string memory) public pure override returns(string memory){
        return "fish";
    }
}