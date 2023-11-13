/**
In this example, we emit a VoteCast event with the voter parameter set to the address of the voter and the candidateId 
parameter set to the ID of the candidate being voted for. By indexing the candidateId parameter, we can quickly search 
for all votes cast for a particular candidate.
 */
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Voting {
  event VoteCast(address voter, uint indexed candidateId);

  function castVote(uint candidateId) public {
    // record the vote
    // ...
    emit VoteCast(msg.sender, candidateId);
  }

}
