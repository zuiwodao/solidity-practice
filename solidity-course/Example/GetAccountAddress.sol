//SPDX-License-Identifier: Unlicense
pragma solidity >=0.7.0 <0.9.0;
//查看各种地址

contract AddressExample{

    address ownerAddress;
    constructor (){
        ownerAddress = msg.sender;
    }
    function getContractAddress() external view returns(address){
        return address(this);
    }

    function getSenderAddress() external view returns(address){
        return msg.sender;
    }

    function getOwnerAddress() public view returns(address){
        return ownerAddress;
    }

    function getBalance() external view returns(uint,uint,uint){
        uint contractBalance = address(this).balance;
        uint senderBalance = msg.sender.balance;
        uint ownerBalance = ownerAddress.balance;
        return (contractBalance,senderBalance,ownerBalance);
    }

    receive() external payable{}//第二种方式

    function transfer(address _to,uint amount) public payable {

    }
        
}