// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Bank {
    // Declare a mapping to store balances
    mapping(address => uint) public balances;

    // Declare a constructor that initializes the contract
    constructor() {
        // Set the initial balance for the contract creator to 100
        balances[msg.sender] = 100;
    }

    // Declare a function to deposit ether into the contract
    function deposit() public payable {
        // Add the amount sent to the sender's balance
        balances[msg.sender] += msg.value;
    }

    // Declare a function to withdraw ether from the contract
    function withdraw(uint amount) public {
        // Make sure the sender has enough balance
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Subtract the amount from the sender's balance
        balances[msg.sender] -= amount;

        // Transfer the amount to the sender
        payable(msg.sender).transfer(amount);
    }
}
