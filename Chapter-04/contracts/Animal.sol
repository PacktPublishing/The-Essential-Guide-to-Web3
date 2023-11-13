//here's an example program that demonstrates inheritance in Solidity:
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Animal {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }

    function move() public virtual returns (string memory) {
        return "Moving...";
    }
}

// Child contract that inherits from Animal
contract Dog is Animal {
    constructor(string memory _name) Animal(_name) {}

    function bark() public pure returns (string memory) {
        return "Woof!";
    }
}

// Child contract that inherits from Animal
contract Cat is Animal {
    constructor(string memory _name) Animal(_name) {}

    function meow() public pure returns (string memory) {
        return "Meow!";
    }
}

// Contract that uses Dog and Cat
contract PetStore {
    Dog public dog;
    Cat public cat;

    constructor() {
        // Create instances of Dog and Cat
        dog = new Dog("Fido");
        cat = new Cat("Whiskers");
    }

    function getDogName() public view returns (string memory) {
        return dog.name();
    }

    function getCatName() public view returns (string memory) {
        return cat.name();
    }

    function moveDog() public returns (string memory) {
        return dog.move();
    }

    function moveCat() public returns (string memory) {
        return cat.move();
    }

    function bark() public pure returns (string memory) {
        return Dog.bark();
    }

    function meow() public pure returns (string memory) {
        return Cat.meow();
    }
}
/**

In this example, we have three contracts: Animal, Dog, and Cat. Dog and Cat both inherit from Animal. 
Animal has a constructor that takes a name argument and sets the name variable. Dog and Cat both call the 
Animal constructor in their own constructors.

Animal has a move function that returns "Moving..." and is marked as virtual, which means that it can be
 overridden by child contracts. Dog and Cat don't override move, so they inherit the implementation from Animal.

Dog has a bark function that returns "Woof!", and Cat has a meow function that returns "Meow!".

Finally, we have a PetStore contract that creates instances of Dog and Cat and uses their functions. It also
 calls the move function on both Dog and Cat, which returns "Moving..." because they inherit the implementation from Animal.
Overall, this example demonstrates how inheritance works in Solidity. Child contracts can inherit variables and functions 
from parent contracts, and they can override functions if needed.
 */
