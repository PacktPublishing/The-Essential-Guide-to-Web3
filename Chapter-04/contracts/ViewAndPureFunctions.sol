// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ViewAndPureFunctions {
    uint public data = 1;

    // Function with view keyword, which promises not to modify the contract state
    function addToData(uint _value) public view returns (uint) {
        return data + _value;
    }

    // Function with pure keyword, which promises not to modify or read from the contract state
    function multiply(uint _a, uint _b) public pure returns (uint) {
        return _a * _b;
    }

    // Function to modify contract state, requires transaction
    function setData(uint _value) public {
        data = _value;
    }
}
