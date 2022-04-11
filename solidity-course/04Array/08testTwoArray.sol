pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;
contract testTwoArray {
    uint[2][3] arrayFixed = [[1,50],[2,60],[2,100]];
    uint[][] arrayFix;
    function getarrayFixed() public view returns(uint[2][3] memory) {
        return arrayFixed;
    }

    function getarrayFix() public view returns(uint[][] memory){
        return arrayFix;
    }

    function getElement() public view returns(uint){
        return arrayFixed[0][1];
    }

    function changElement() public {
        arrayFixed[0][1] = 63;
    }

    function getLength() public view returns(uint) {
        return arrayFixed[0].length;
        }
    
    function pushArray() public  {
        arrayFix.push([1,2]);
    }

    function searchArrayFixed() public view returns(uint){
        uint sum = 0;
        for (uint i=0 ; i < arrayFixed.length; i++){
            for(uint j=0; j<arrayFixed[i].length;j++){
                sum +=arrayFixed[i][j];
               
            }
        }
        return sum;
    }
}