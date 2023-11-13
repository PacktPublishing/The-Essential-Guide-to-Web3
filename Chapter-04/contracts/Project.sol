//Here is an example program that explains how contracts can create other contracts
//in Solidity using a factory pattern. It creates a ProjectFactory contract that is
//used to create instances of Project contracts.

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Project {
    address public owner;
    uint public goal;
    uint public deadline;
    uint public fundsRaised;

    constructor(address _owner, uint _goal, uint _deadline) {
        owner = _owner;
        goal = _goal;
        deadline = _deadline;
    }

    function contribute() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        fundsRaised += msg.value;
    }

    function isSuccessful() public view returns (bool) {
        return (fundsRaised >= goal);
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw funds");
        require(isSuccessful(), "Project is not successful");

        payable(owner).transfer(fundsRaised);
    }
}

contract ProjectFactory {
    uint public fee;
    address[] public projects;

    constructor(uint _fee) {
        fee = _fee;
    }

    function createProject(uint _goal, uint _deadline) public payable {
        require(msg.value == fee, "Fee must be paid to create project");
        address newProject = address(new Project(msg.sender, _goal, _deadline));
        projects.push(newProject);
    }

    function getProjects() public view returns (address[] memory) {
        return projects;
    }
}

/**

The Project contract is a simple crowdfunding contract that allows users to contribute funds towards a
goal and withdraw the funds when the goal is reached.

The ProjectFactory contract is used to create instances of Project contracts using a factory pattern. 
It has a createProject function that takes in the goal and deadline for the project, and creates a new Project 
contract with the sender as the owner.

The ProjectFactory contract also has a fee variable that must be paid to create a new project. This ensures 
that only serious projects are created.

The ProjectFactory contract also has a getProjects function that returns an array of addresses of all 
the projects that have been created using the factory.

Overall, this example demonstrates how contracts can create other contracts in Solidity, which can
be useful for implementing complex systems with multiple layers of contracts

 */