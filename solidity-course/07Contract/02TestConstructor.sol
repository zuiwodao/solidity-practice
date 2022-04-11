//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.8.0;

contract TestConstructor{
    address owner;
    string name;

    constructor() public {
        owner = msg.sender;
        name = "Nico"; 
    }

    function changeName(string memory _name) public {
        require(owner == msg.sender);
        name = _name;
    }

    function getName() public view returns(string memory){
        return name;
    }
}