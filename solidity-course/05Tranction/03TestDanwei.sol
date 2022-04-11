//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestDanwei {
    uint public lastUpdated ;
    function setLadtUpdated() public{
        lastUpdated = block.timestamp;
    }

    function fiveM() public view returns (bool) {
        if ( block.timestamp > lastUpdated + 5 seconds){
            return true;
        }else{
            return false;
        }
    }
}