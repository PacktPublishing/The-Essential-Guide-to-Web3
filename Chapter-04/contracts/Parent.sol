//Here's an example program that demonstrates shadowing inherited state variables in Solidity:
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Parent {

    uint public myVar = 10;
}

// Define a child contract that inherits from Parent
contract Child is Parent {
    // Define a new state variable with the same name as the parent's state variable
    uint public myVar = 20;
    
    // Define a function that returns the values of both myVar state variables
    function getMyVars() public view returns (uint, uint) {
        return (super.myVar, myVar);
    }
}

// Deploy the child contract and call the getMyVars function
contract Test {
    Child public child = new Child();
    
    function testMyVars() public view returns (uint, uint) {
        return child.getMyVars();
    }
}

/**

In this example, we have a parent contract Parent that defines a state variable myVar with a value of 10. Then, 
we define a child contract Child that inherits from Parent and defines a new state variable myVar with a value of 20. 
This means that the child's myVar variable "shadows" the parent's myVar variable, meaning that the child's variable takes 
precedence over the parent's variable.

To demonstrate this, we define a function getMyVars in the child contract that returns the values of both myVar stat
e variables. We also define a separate contract Test that deploys an instance of the child contract and calls the getMyVars function.

When we call the testMyVars function in the Test contract, it returns a tuple with the values (10, 20). 
This shows that the child's myVar variable has a value of 20, while the parent's myVar variable still has a value 
of 10. We use the super keyword to access the parent's myVar variable from within the child contract.

 */