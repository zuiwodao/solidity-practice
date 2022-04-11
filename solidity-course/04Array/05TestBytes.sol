pragma solidity ^0.6.0;
contract testBytes{
    bytes6 by = 0x121314151617;
    function fixToDynamic() public view returns(bytes memory){
        bytes memory temp = new bytes(10);
        for (uint i ; i < by.length; i++){
            temp[i] = by[i];
        }
        
        return temp;
    }
}