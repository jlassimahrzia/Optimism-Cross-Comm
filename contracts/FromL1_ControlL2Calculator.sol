//SPDX-License-Identifier: Unlicense
// This contracts runs on L1, and controls a Calculator on L2.
pragma solidity ^0.7.3;

import { ICrossDomainMessenger } from "@eth-optimism/contracts/libraries/bridge/ICrossDomainMessenger.sol";
    
contract FromL1_ControlL2Calculator {
    
    // Taken from https://github.com/ethereum-optimism/optimism/tree/develop/packages/contracts/deployments/goerli
    address Proxy__OVM_L1CrossDomainMessenger = 0x5086d1eEF304eb5284A0f6720f79403b4e9bE294;

    function calculate(uint256 number1, uint256 number2, string memory codeOps, address calculatorL2ContractAddress) public {

        ICrossDomainMessenger(Proxy__OVM_L1CrossDomainMessenger).sendMessage(
            calculatorL2ContractAddress,
            abi.encodeWithSignature(
                "operation(uint256,uint256,string)",
                number1,
                number2,
                codeOps
            ),
            1000000  // Gas limit
        );

    }

}          
