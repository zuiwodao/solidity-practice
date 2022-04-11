pragma solidity ^0.6.0;
contract TestBytes{
    bytes1 _b = 0x01;
    bytes1 _c = hex"01";

    bytes2 _bc = "bc";
    bytes3 _abc = "abc";
    function getABC() public returns(bytes3 ab){
       return _abc;
    }

}