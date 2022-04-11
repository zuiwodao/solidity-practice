//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.7.0;

contract TestEnum{
    enum Sex{Man,Woman}

    function useEnum() public pure returns(Sex){
        return Sex.Man;
    }

    function useEnum2() public pure returns(Sex){
        return Sex.Woman;
    }
}