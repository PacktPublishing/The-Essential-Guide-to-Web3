
/**
In this example, we define a smart contract called Token that represents a simple token. 
This contract has a balanceOf mapping that maps addresses to their token balances. 
Additionally, this contract defines an event called Transfer, which is emitted whenever the transfer function is called. 
The Transfer event takes in the from address, the to address, and the value that was transferred. 
External applications can listen to this event to keep track of token transfers on the blockchain.

 */
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Token {
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function transfer(address to, uint256 value) public {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
    }
}