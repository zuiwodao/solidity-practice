pragma solidity >=0.6.0<0.8.0;
contract testFixArray{
    uint[5] a = [1,2,3,4,5];
    uint[5] b;
    function initB() public{
        b[0] = 1;
        b[1] = 3;
        b[2] = 4;
        b[3] = 5;
    }
    
    function getB() public view returns(uint[5] memory){
        return b;
    }

    function changeB() public {
        b[2] = 16;
    }

    function getLength() view public returns(uint){
        return b.length;
    }

    function changLength() view public returns(uint){
        uint sum = 0;
        for (uint i ; i<b.length; i++){
            sum += b[i];
        }
        return sum;
    }
}