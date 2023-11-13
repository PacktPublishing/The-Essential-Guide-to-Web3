//Here's an example program in Solidity that demonstrates the use of the import statement:

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ImportExample {

// Import the SafeMath library from OpenZeppelin
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

    // Use SafeMath's `add` function to add two numbers
    function addNumbers(uint256 a, uint256 b) public view returns (uint256) {
        return SafeMath.add(a, b);
    }
}

/**
The import statement is used to import code from another file. In this example, we're importing 
the SafeMath library from OpenZeppelin's contracts.

The @openzeppelin/contracts part of the import statement is a reference to the package we want 
to import from, and the utils/math/SafeMath.sol part is the path to the specific file we want 
to import.

Once we've imported the SafeMath library, we can use its functions in our contract. In this 
example, we're using the add function to add two numbers.

Note that we're calling the add function using the SafeMath. prefix, which is necessary since
 we're calling a function from an imported library.

 */