//Here's an example program that demonstrates how to call other contracts in Solidity:


// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Interface for the target contract
interface TargetContract {
    function add(uint256 a, uint256 b) external returns (uint256);
    function getOwner() external view returns (address);
}

contract CallerContract {
    TargetContract public target;

    constructor(address _targetContractAddress) {
        // Set the target contract address
        target = TargetContract(_targetContractAddress);
    }

    function callAdd(uint256 a, uint256 b) public returns (uint256) {
        // Call the add function in the target contract
        return target.add(a, b);
    }

    function getTargetOwner() public view returns (address) {
        // Call the getOwner function in the target contract
        return target.getOwner();
    }
}

/**
In this example, we have two contracts: CallerContract and TargetContract. CallerContract is responsible for calling functions 
in the TargetContract.

We define an interface for the TargetContract which specifies the functions that we want to call. The 
CallerContract then creates an instance of the TargetContract by passing in the address of the deployed 
TargetContract to the constructor.

We then define two functions in CallerContract to call the add and getOwner functions in the TargetContract. We use the 
target instance to call the functions.

The callAdd function takes two input parameters, calls the add function in the TargetContract, and returns the result.

The getTargetOwner function calls the getOwner function in the TargetContract and returns the owner's address.

Note that the contract interface should match the functions in the target contract exactly, including the function 
signatures and return types. This is to ensure that Solidity can correctly encode the function arguments and decode the return values.



 */