//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestGlobalValue{
    function getBlockHash() public view returns(bytes32) {
        return blockhash(block.number-1);
    }

    function getBlockCoinbase() public view returns(address){
        return block.coinbase;
    }

    function getBlockDifficulty() public view returns(uint){
        return block.difficulty;
    }

    function getGasLimit() public view returns(uint){
        return block.gaslimit;
    }

    function getBlockNumber() public view returns(uint){
        return block.number;
    }

    function getMsgSender() public view returns(address){
        return msg.sender;
    }

    function getMsgValue() public view  returns(uint){
        return 0x1Bab33CF2B9aE745ac27BF471708f50e4923fA81.balance;
    }
}
