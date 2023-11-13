//Example 2: Contract with an event
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma solidity ^0.8.0;

contract EventContract {
    event NewNumber(uint256 number);
    
    uint256 public myNumber;
    
    constructor(uint256 _number) {
        myNumber = _number;
    }
    
    function setNumber(uint256 _number) public {
        myNumber = _number;
        emit NewNumber(myNumber);
    }
}
