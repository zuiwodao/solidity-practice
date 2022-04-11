//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
//接受eth的合约结构

contract HelloWorld{
    string private text;

    function get() external view returns(string memory){
        return text;
    }

    function set(string memory _text) payable external {//第一种方式
        text =_text;
    }

    receive() external payable{//第二种方式
        text = "fallback";
    }
}


