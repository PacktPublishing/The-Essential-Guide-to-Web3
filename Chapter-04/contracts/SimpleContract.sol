/**

Example 1: Simple contract with a state variable

 */

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleContract {
    uint256 public myNumber;
    
    constructor(uint256 _number) {
        myNumber = _number;
    }
    
    function setNumber(uint256 _number) public {
        myNumber = _number;
    }
}