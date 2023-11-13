// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Multicall {
    function aggregate(
        address[] memory targets,
        bytes[] memory calls
    ) public returns (bytes[] memory results) {
        results = new bytes[](calls.length);

        for (uint i = 0; i < calls.length; i++) {
            (bool success, bytes memory result) = targets[i].call(calls[i]);
            require(success, "Call failed");

            results[i] = result;
        }
    }
}

/**
In this contract, we define a function called aggregate that takes in two arrays as 
parameters: an array of contract addresses and an array of function calls. The 
function then loops through each element of the two arrays and makes a call to the 
contract at the corresponding address with the corresponding function call. The 
results of each call are then stored in an array and returned.

To use this contract, we simply need to call the aggregate function with an 
array of contract addresses and an array of function calls. The results of 
each function call will be returned as an array of bytes.

It is important to note that this contract should only be used for read-only 
functions that do not modify the state of any contract. If a function call 
modifies the state of a contract, it should not be used with the aggregate 
function.
*/