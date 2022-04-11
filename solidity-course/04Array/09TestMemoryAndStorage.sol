pragma solidity >=0.6.0 <0.8.0;

contract testMemoryAndStorage{
    uint[] a1 = [1,2,3];//状态变量都是storage
    function storageToMemory() public {
            uint[] memory b =a1;//如果是storage就是地址传递，如果是memory就是值传递。
            b[0] = 100;
    }
    function getA1() public view returns(uint[] memory){
        return a1;
    }
}