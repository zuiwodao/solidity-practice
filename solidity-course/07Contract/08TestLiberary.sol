//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;
//库的使用


library Search{
    function indexOf(uint[] storage data,uint _value) public view returns(uint){
        for (uint i=0;i<data.length;i++){
            if(data[i] == _value){
                return i;
            }
        }
        return 100;
    }
}

//设有一个数组，根据传值，找到此值所在的索引位
contract TestLiberary{
    uint[] data;
    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
    }

function indexOf(uint _value) public view returns(uint){
       return Search.indexOf(data,_value);
    }
}