// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedMapping {
  constructor() public {
  }

  / Mapping from address to uint
mapping(address => uint256) public userBalance;

function deposit() public payable {
    userBalance[msg.sender] += msg.value;
}

function withdraw(uint256 _amount) public {
    require(userBalance[msg.sender] >= _amount, "Insufficient balance");
    userBalance[msg.sender] -= _amount;
    payable(msg.sender).transfer(_amount);
}

function checkBalance(address _addr) public view returns (uint256) {
    return userBalance[_addr];
}

// Nested mapping (mapping from address to another mapping)
mapping(address => mapping(uint256 => bool)) public vote;

function voteForProposal(uint256 _proposalId) public {
    require(!vote[msg.sender][_proposalId], "Already voted");
    vote[msg.sender][_proposalId] = true;
}

function checkVote(address _addr, uint256 _proposalId) public view returns (bool) {
    return vote[_addr][_proposalId];
}

}
