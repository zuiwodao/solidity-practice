//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.7.0;

contract TestEvent{
    event logEvent(string indexed _name, uint indexed _age);

    function emitEvent() public{
        emit logEvent("Nico",28);
    }
}