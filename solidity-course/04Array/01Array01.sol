pragma solidity >=0.6.0<0.8.0;
contract Array01{
    uint[5] public fix;
    uint[]  public ufix;
    uint[5] a = [1,2,3,4,5];
    uint[] b = [1,3,4,5];
    uint[] x = new uint[](4);
    function init() public {
        fix = [6,7,8,9,10];
        fix[0] = 12;
        ufix.push(10);
        ufix.push(12);
    }
    function getFix() public view returns(uint[5] memory){
        return fix;
    }
    function getUfix() public view returns(uint[] memory){
            return ufix;
    }
}