//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;
//父合约构造函数的传参
contract father{
    uint age;
    constructor(uint _age) public {
        age = _age;
    }
}

contract sun is father(30){//继承式
    function getAge() public view returns(uint){
       return age;
    }
}


contract sun2 is father{
    constructor() father(35) public{}//修改风格式
    function getAge() public view returns(uint){
        return age;
        }
    
}