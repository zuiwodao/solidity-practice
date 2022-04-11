pragma solidity ^0.6.0;
contract TestInt{
    int8 public _i = 127;

    function getI() public view returns(int ){
        return _i;
    }

    uint8 public _m = 129;

    function getM() public view returns(uint ){
        return _m;
    }
}