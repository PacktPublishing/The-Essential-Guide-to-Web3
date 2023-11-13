// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


// Define an interface for a contract that implements a 'doSomething' function
interface SomeContractInterfaceExample {
    function doSomething() external returns (uint);
}

// A contract that calls the 'doSomething' function of another contract
contract Caller {
    // The address of the contract to call
    address public someContractAddress;

    // Constructor to set the address of the contract to call
    constructor(address _someContractAddress) {
        someContractAddress = _someContractAddress;
    }

    // Call the 'doSomething' function of the other contract and return the result
    function callDoSomething() public returns (uint) {
        // Create an interface object for the other contract using its address
        SomeContractInterfaceExample someContract = SomeContractInterfaceExample(someContractAddress);
        
        // Call the 'doSomething' function of the other contract using the interface object
        return someContract.doSomething();
    }
}

// A contract that implements the 'doSomething' function
contract SomeContractImpl is SomeContractInterfaceExample {
    // Implementation of the 'doSomething' function
    function doSomething() external override returns (uint) {
        return 42;
    }
}

/**

n this example, we define an interface SomeContract that specifies a single function doSomething. 
We then define a contract Caller that takes the address of a contract implementing the SomeContract interface in its 
constructor. The callDoSomething function of the Caller contract creates an instance of the SomeContract interface using 
the address of the other contract and calls its doSomething function.

We also define a contract SomeContractImpl that implements the SomeContract interface by providing 
its own implementation of the doSomething function.

Using interfaces allows us to interact with other contracts in a standardized way without having 
to know the details of their implementation. In this example, the Caller contract can call the doSomething 
function of any contract that implements the SomeContract interface, regardless of its specific implementation.
 */