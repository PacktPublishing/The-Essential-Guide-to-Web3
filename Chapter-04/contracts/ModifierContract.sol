//Example 3: Contract with a modifier

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ModifierContract {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }
    
    function setOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }
}