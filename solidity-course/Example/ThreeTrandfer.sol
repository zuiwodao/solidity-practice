//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;

contract ThreeTransfer{
    function send(address payable _to) public payable{
        bool isSend = _to.send(msg.value);
        require(isSend,"Send fail");
    }

    function transfer(address payable _to) public payable{//无返回值
        _to.transfer(msg.value);
    }

    function calls(address payable _to) public payable{
        (bool iscall,) = _to.call{value:msg.value}("");
        require(iscall,"Call Fail");
    }
}