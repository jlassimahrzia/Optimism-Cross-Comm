//SPDX-License-Identifier: Unlicense
// This contracts runs on L2, and controls a Calculator on L1.
pragma solidity ^0.7.3;

import { ICrossDomainMessenger } from "@eth-optimism/contracts/libraries/bridge/ICrossDomainMessenger.sol";
    
contract FromL2_ControlL1Calculator {
    
    // Taken from https://github.com/ethereum-optimism/optimism/tree/develop/packages/contracts/deployments/goerli
    address L2CrossDomainMessenger = 0x4200000000000000000000000000000000000007;

    function calculate(uint256 number1, uint256 number2, string memory codeOps, address calculatorL1ContractAddress) public {

        ICrossDomainMessenger(L2CrossDomainMessenger).sendMessage(
            calculatorL1ContractAddress,
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
