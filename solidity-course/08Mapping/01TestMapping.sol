//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestMapping{
    mapping(uint => string) public uintMapping;
    mapping(address => uint) public addressMapping;
    mapping(string => mapping(uint => address)) public stringMapping;

    constructor() public{
        uintMapping[1] = "Nico";
        uintMapping[2] = "Lisi";
        addressMapping[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = 5;
        addressMapping[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = 8;

        stringMapping["Nico"][1] = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    }
    //mapping相当于下面的getter函数。
    //function uintMapping(uint _u) public view returns(string memory){
    //    return uintMapping[_u];
    //}
    //function stringMapping(string memory _s,uint _u) public view returns(address){
    //    return stringMapping[_s][_u];

}