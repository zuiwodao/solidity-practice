pragma solidity >=0.6.0 <0.8.0;
contract TestSuanShu{
    //测试运算符
    function test1(uint a,uint b) public pure returns(uint,uint){
        return (a**b,a%b);
    }
    //2、测试自增加和自减
    function test2(uint a) public pure returns(uint,uint){
        uint c = a++;//先使用a的值，再将a加上1
        return (c,a);
    }
     function test3(uint a) public pure returns(uint _c,uint _a){
        uint c = ++a;//先将a加上1,再使用a的值
        return (c,a);
    }
    //3、整型字面量截断的问题
    function test4() public pure returns(uint){
        uint a = 10;
        uint b = 3;
        return a/b; 
        //3除法运算，使用变量运算时，时截断的
    }
    function test5() public pure returns(uint){
        uint a = 1/3*3;  
        //整型字面量做除法运算不截断
        return a;
    }

}