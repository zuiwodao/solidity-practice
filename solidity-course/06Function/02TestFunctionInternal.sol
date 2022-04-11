//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestFunctionInternal {
    function testFunctionInternal() internal pure returns(uint){
        return 10;
    }

    function testFunctionExternal() external pure returns(uint){
        return 20;
    }

    function testFunctionPublic() public pure returns (uint){
        return 30;
    }

    function testFunctionPrivate() private pure returns(uint){
        return 40;
    }

    function test() public view returns(uint){
        return this.testFunctionExternal();
    }
}

contract Test{
    function test2() public payable returns(uint){
        TestFunctionInternal tf = new TestFunctionInternal();//新实例
        return tf.testFunctionExternal();//调用函数
    }
}