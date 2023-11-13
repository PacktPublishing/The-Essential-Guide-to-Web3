// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Storage {
    uint public num;

    function setNum(uint _num) public {
        num = _num;
    }
}

contract Proxy {
    address public currentAddress;
    address public owner;

    constructor(address _initialAddress) {
        currentAddress = _initialAddress;
        owner = msg.sender;
    }

    // Fallback function that forwards all calls to the current implementation contract
    fallback() external payable {
        address implementation = currentAddress;
        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize())
            let result := delegatecall(
                gas(),
                implementation,
                ptr,
                calldatasize(),
                0,
                0
            )
            let size := returndatasize()
            returndatacopy(ptr, 0, size)

            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
    }

    // Only the owner can change the implementation contract
    function upgrade(address _newAddress) public {
        require(msg.sender == owner, "Only the owner can upgrade");
        currentAddress = _newAddress;
    }

    // Owner can change the owner of the proxy contract
    function transferOwnership(address _newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership");
        owner = _newOwner;
    }
}

/**
This program has two contracts: Storage and Proxy. Storage is a simple contract that has one state variable, 
num, and a function to set its value. Proxy is a contract that is designed to delegate function calls to the 
current implementation contract.

The Proxy contract has a currentAddress state variable that represents the current implementation contract. 
The constructor function takes an initial implementation contract address as an argument, and sets it as the currentAddress. 
The fallback function is called whenever a function is called on the Proxy contract that does not match any of its
existing functions. It forwards the call to the currentAddress using a delegatecall, which allows the currentAddress
contract to use the storage and context of the Proxy contract.

The upgrade function allows the owner of the Proxy contract to upgrade the implementation contract by 
setting a new address for currentAddress. The transferOwnership function allows the owner to transfer 
ownership of the Proxy contract to a new address.

The delegatecall function is called using assembly code in the fallback function. It takes four arguments: gas, 
implementation, ptr, and calldatasize. gas specifies the amount of gas to be provided for the call. implementation
is the address of the contract that the call should be forwarded to. ptr is a pointer to the start of the input 
data, and calldatasize is the size of the input data.

The delegatecall function executes the code of the implementation contract using the storage and context of 
the Proxy contract. It returns a boolean value that indicates whether the function call was successful, and 
a pointer to the return data. If the call was unsuccessful, it reverts with the returned data. If the call was 
successful, it returns the returned data.

In summary, the delegatecall function is a powerful tool for creating upgradeable contracts in Solidity. By 
using delegatecall, a contract can delegate function calls to another contract while preserving the storage and 
context of the original contract.

 */
