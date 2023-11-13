// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FunctionModifierExample {
    uint private value;
    address private owner;

    // Define a function modifier that checks whether the caller is the owner of the contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _; // This tells Solidity to execute the function if the modifier's condition is true
    }

    // Define a function modifier that checks whether the value is greater than 0
    modifier greaterThanZero(uint _value) {
        require(_value > 0, "Value must be greater than 0.");
        _; // This tells Solidity to execute the function if the modifier's condition is true
    }

    // Constructor to set the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to set the value
    function setValue(uint _value) public onlyOwner greaterThanZero(_value) {
        value = _value;
    }

    // Function to get the value
    function getValue() public view returns (uint) {
        return value;
    }
}
