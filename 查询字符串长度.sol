pragma solidity ^0.4.0;
 

contract String_Math{
    string name = "wangyufeng"; //0x77616e67797566656e67
    string name1 = "王不二";
    
    function getlength() external view returns(uint){
        // return name.length; 错误
        return bytes(name).length;
    }
    
    function getName() public view returns(bytes){
        return bytes(name);
    }
    
     function getName1() public view returns(bytes){ // 0xe78e8be4b88de4ba8c
        return bytes(name1);
    }
    
    function changeName() public { 
        bytes(name)[0] = "p";  // 0x70616e67797566656e67
    }
}