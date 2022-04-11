pragma solidity ^0.6.0;
contract testString{
    bytes9 sex = "女演员";
    function getsex() public view returns(bytes9){
        return sex;
    }
    bytes sex1 = "女演员";
    function getsex1() public view returns(bytes memory) {
        return sex1;
    }

    string sex2 = "女演员";
    function getsex2() public view returns(string memory){
        return sex2;
    }

    function getsex3() public view returns (uint){
        return bytes(sex2).length/3;
    }
}
