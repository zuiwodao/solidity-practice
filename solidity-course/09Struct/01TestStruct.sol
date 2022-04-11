//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.7.0;
//pragma abicoder v2;
pragma experimental ABIEncoderV2;

contract TestStruct{
    struct Student{
        uint id;
        string name;
     //   mapping(string => uint) grade;
        //uint[] array;可以使用数组
        //Student stu;不能使用结构体
    }

    Student st;

    constructor() public {
        //Student memory stu = Student(1,"Nico");//第一张赋值方法
        Student memory stu = Student({name:"Nico",id:1});
        st = stu;
       // st.grade["yuwen"] = 45;
    }

    function get() public view returns(Student memory){
        return st;
    }

}