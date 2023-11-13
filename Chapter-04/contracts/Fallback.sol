// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Fallback {
    event LogReceived(address indexed from, uint value);

    // fallback function
    fallback() external payable {
        emit LogReceived(msg.sender, msg.value);
    }

    function withdraw() external {
        // do something
    }
}
// The contract above has a fallback function that is called when a function is invoked that does not exist in the contract,
// or when a transfer of ether is made to the contract.

// When a transfer of ether is made to the contract, the fallback function is called automatically.
//In this example, the fallback function emits an event to log the address of the sender and the amount of ether that was transferred.

// If a function is invoked that does not exist in the contract, the fallback function is called if there is no
//receive function in the contract. If there is a receive function, it will be called instead of the fallback function.

// The fallback function can also be defined with the receive() external payable syntax in Solidity 0.8 or higher.
// The receive function is similar to the fallback function, but it can only receive ether and cannot have any arguments.

// Note that a contract can have only one fallback function, and it must be marked as external.

// In this example, there is also a withdraw function which is not related to the fallback function.
// It is included to show that other functions can be defined in the contract alongside the fallback function.
