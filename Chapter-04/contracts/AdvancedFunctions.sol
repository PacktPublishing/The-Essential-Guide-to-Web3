// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedFunctions {
    constructor() public {}

    // Example of a function that takes in two integers and returns their sum.
    function sum(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // Function that returns multiple values.
    function returnMultipleValues() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // Function that returns named values.
    function namedValues() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // Function that assigns named values to their name.
    function assignedValues() public pure returns (uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Function that uses destructuring assignment when calling another function that returns multiple values.
    function destructuringAssignments()
        public
        pure
        returns (uint, bool, uint, uint, uint)
    {
        (uint i, bool b, uint j) = returnMultipleValues();

        // Values can be left out.
        (uint x, , uint y) = (4, 5, 6);

        return (i, b, j, x, y);
    }

    // Function that takes in an array as input.
    function arrayInput(uint[] memory _arr) public {}

    // Function that returns an array.
    uint[] public arr;

    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }

    // Function that takes in a struct as input.
    struct Person {
        string name;
        uint age;
    }

    function setPerson(Person memory _person) public {}

    // Call function with key-value inputs.
    function funcWithKeyValueInputs(
        uint x,
        uint y,
        uint z,
        address a,
        bool b,
        string memory c
    ) public pure returns (uint) {
        // Function logic goes here.
    }

    function callFunc() external pure returns (uint) {
        return funcWithKeyValueInputs(1, 2, 3, address(0), true, "c");
    }

    function callFuncWithKeyValue() external pure returns (uint) {
        return
            funcWithKeyValueInputs({
                a: address(0),
                b: true,
                c: "c",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
