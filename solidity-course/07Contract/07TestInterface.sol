//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;
/*接口关键字interface
接口中必须是抽象合约，所以可以省略virtual关键字
*接口函数的修饰必须用external
接口作用：起到更强的约束作用
*/

interface Father{
    function eat() external pure;
}

contract Sun is Father{
    function eat() public pure override{} 
}

