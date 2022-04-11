//version
pragma solidity ^0.6.0;

contract Helloworld{
    //状态变量（状态变量放在区块链张）
    string name="nico";
    //view修饰的函数，表示访问状态变量（区块链上的数据），但是不会修改，不会消耗任何资源
    function getName() public view  returns(string memory){
        return name;
    }
    //pure修饰的函数，不修饰也不读取状态变量（区块链上的数据），不会消耗任何资源。
    function f() public pure returns(string memory){
        return "lisi";
    }
    // 会修改区块链上的数据
    function setName() public{
        name = "Nico";
    }
}