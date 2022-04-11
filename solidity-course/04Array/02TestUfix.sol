pragma solidity ^0.6.0;
contract testUfixArray{
    uint[] a = [1,2,3,4,5];
    uint[] b;
    function initB() public{
        b.push(6);
        b.push(9);
    }
    function getLength() view public returns(uint){
        return b.length;
    }
    function getB() view public returns(uint[] memory){
        return b;
    }
}