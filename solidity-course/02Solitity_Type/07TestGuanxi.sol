pragma solidity >=0.6.0 <0.8.0;
contract testGuanxi{
    function test() public pure returns(bool,uint,uint){
    uint a = 3;
    uint b = 4;
    return (a++>b,a,b);
    }
}