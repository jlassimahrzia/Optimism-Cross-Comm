// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import { IL1CrossDomainMessenger } from "https://github.com/ethereum-optimism/optimism/blob/develop/packages/contracts/contracts/L1/messaging/IL1CrossDomainMessenger.sol";
contract CalculatriceCallerContract {
    function calculate(uint256 number1, uint256 number2, string memory codeOps, address calculatriceContractAddress) public { 
        IL1CrossDomainMessenger(0x5086d1eEF304eb5284A0f6720f79403b4e9bE294).sendMessage(
            calculatriceContractAddress,
            abi.encodeWithSignature(
                "operation(uint256,uint256,string)",
                number1,
                number2,
                codeOps
            ),
            1000000 // use whatever gas limit you want
        );
    }
  
}