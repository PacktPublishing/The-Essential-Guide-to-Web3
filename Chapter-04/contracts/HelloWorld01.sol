//Here's an example of a HelloWorld Smart Contract in Solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld01 {
    string greeting;

    constructor() {
        greeting = "Hello, World!";
    }

    function greet() public view returns (string memory) {
        return greeting;
    }
}