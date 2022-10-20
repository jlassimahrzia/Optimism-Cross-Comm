//SPDX-License-Identifier: Unlicense
pragma solidity ^0.7.3;

contract Calculator {

    uint256 result;

    function operation(uint256 number1, uint256 number2, string memory operationCode) public {
     
        if(keccak256(abi.encodePacked(operationCode)) == keccak256(abi.encodePacked("+"))){
            result = number1 + number2;
        }else if(keccak256(abi.encodePacked(operationCode)) == keccak256(abi.encodePacked("-"))){
            result = number1 - number2;
        }else if(keccak256(abi.encodePacked(operationCode)) == keccak256(abi.encodePacked("*"))){
            result = number1 * number2;
        }else if(keccak256(abi.encodePacked(operationCode)) == keccak256(abi.encodePacked("/"))){
            if(number2 != 0){
                result = number1/number2;
            }
        }
    }

    function getResult() public view returns(uint256){
      return result;
    }
}