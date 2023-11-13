//In this example, we define a simple smart contract that has a single event called Log. 
//This event takes in a string message and a timestamp, which are both emitted when the log function is called.
// This event can be listened to by external applications that are interested in knowing when the log function is called.
// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;
contract SimpleEvent {
    event Log(string message, uint256 timestamp);

    function log(string memory message) public {
        emit Log(message, block.timestamp);
    }
}