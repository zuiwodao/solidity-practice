pragma solidity >=0.6.0 <0.8.0;

contract TestAddress{
    function testAddress() public view returns(uint160){
        address _address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        return uint160(_address);
    }
}