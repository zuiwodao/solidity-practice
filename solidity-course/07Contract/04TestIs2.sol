//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

//状态变量不能重写，函数重写关键字virtual,override

contract Father{
    function eat() public pure virtual returns(string memory){
        return "meat";
    }
}


contract Sun is Father{
    //override
    function eat() public pure override returns(string memory){
        return "fish";
    }
    //函数重载,多态，同一个合约，名字相同，函数的参数的个数或类型不同，函数返回值类型无所谓。
    function eat(string memory _m) public pure returns(string memory){
        return _m;
    }

    function test() public pure returns(string memory){
        return super.eat();//调用父类函数。使用super关键字,还可以用Father
    }
    //新增的函数
    function drink() public pure returns(string memory){
        return "jiu";
    }


}