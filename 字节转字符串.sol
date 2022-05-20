pragma solidity ^0.8.0;
 
contract test_bytesTostring{
   
    //测试用例；0x6331000000000000000000000000000000000000000000000000000000000000
    function bytes32Tostring2(bytes2 new_name) public pure returns(string memory){
      
        uint count = 0; //定义一个计数器
        
        for(uint i=0;i<new_name.length;i++){//通过循环判断单个字符是否为0
            bytes1 char = new_name[i];
            if(char != 0){ // 如果字符不为0，就将count+1
                count++;
            }
        }
        
        bytes memory _newName = new bytes(count);//此时字节数组的长度变为了count，因为count不包含0
        
        for(uint j = 0;j < count;j++){//进行赋值
            _newName[j] = new_name[j];
        }
        
        return string(_newName);//输出结果
    }
    
    
    
}
contract Getybytes32_2 {
    //b32Arr是局部变量，bytes32("c1"),c1转换成16进制，不足位补0
    function getBytes32ArrayForInput() pure public returns (bytes32[3] memory b32Arr) {
    b32Arr = [bytes32("c1"), bytes32("c2"), bytes32("c3")];
}
}