//Here is an example of how to define and emit an event in a Solidity smart contract:

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyContract08 {
  event LogMessage(string message);

  function sendMessage(string memory message) public {
    emit LogMessage(message);
  }
}
