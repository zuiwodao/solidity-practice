//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.7.0;

contract TestException{
    function testRevert(uint _i,uint _u) public returns(uint){
        uint data = 200;
        require(_i<30,"i>30");
        revert(_u<10);
    }
    
    event succesEvent();
    event requireEvent();
    event revertEvent();
    function testTry(uint _i,uint _u) public {
        try this.testRevert(_i,_u){
            emit succesEvent();
        }catch{
            emit requireEvent();
        }catch{
            emit revertEvent();
        }
    }
}