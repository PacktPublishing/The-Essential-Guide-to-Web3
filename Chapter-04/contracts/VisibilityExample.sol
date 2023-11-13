//Here's an example program that demonstrates the different visibility modifiers in Solidity:
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract VisibilityExample {

    uint public publicVar = 1;
    uint internal internalVar = 2;
    uint private privateVar = 3;

    function getPrivateVar() public view returns (uint) {
        return privateVar;
    }

    function setPrivateVar(uint _value) public {
        privateVar = _value;
    }

    function getInternalVar() public view returns (uint) {
        return internalVar;
    }

    function setInternalVar(uint _value) public {
        internalVar = _value;
    }

    function publicFunction() public view returns (uint) {
        return privateFunction();
    }

    function internalFunction() internal view returns (uint) {
        return privateFunction();
    }

    function privateFunction() private view returns (uint) {
        return privateVar;
    }
}

/**
In this program, we have three state variables: publicVar, internalVar, and privateVar. Each of these state variables has a 
different visibility modifier applied to it:

publicVar is declared as public, which means that it can be read from and written to by any external account.

internalVar is declared as internal, which means that it can only be accessed within the contract and any contracts that inherit from it.

privateVar is declared as private, which means that it can only be accessed within the contract.

The program also defines three functions: publicFunction, internalFunction, and privateFunction. Each of these functions has a different 
visibility modifier applied to it:

publicFunction is declared as public, which means that it can be called by any external account. Within the function, it calls 
privateFunction which is declared as private. This is allowed because private functions can be called by any function within the same contract.

internalFunction is declared as internal, which means that it can only be called within the contract and any contracts that inherit from it.
Within the function, it also calls privateFunction.

privateFunction is declared as private, which means that it can only be called within the contract.

Finally, the program also defines two getter and setter functions for privateVar and internalVar, 
which demonstrate how state variables can be accessed and modified from external accounts.

Overall, this program demonstrates how the different visibility modifiers can be used to control access 
to state variables and functions within a Solidity contract.


 */