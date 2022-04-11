pragma solidity >=0.6.0 <0.8.0;

contract testTranction{
    function getBalance() public view returns(uint){
        return address(this).balance;//当前合约账户余额
    }

    function getBalance2(address _address) public view returns(uint){
        return _address.balance;//外部账户余额
    }

    //Transfer
    function toContractAccount() public payable {
            address(this).transfer(msg.value);
    }

    fallback() payable external {}
    receive() payable external {}

    function toContractAccount2() public payable {
        address payable _address = address(this);
        _address.transfer(10 ether);
    }

    function toContractAccountSend() public payable returns(bool) {
        address payable _address = address(this);
        _address.send(10 ether);
    }

    function testSend(address payable _address) public payable returns(bool) {
        _address.send(10 ether);
    }


}