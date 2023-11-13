/*
Here's an example of declaring and using boolean variables in Solidity:
*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract MyContract01 {
  bool public isReady = false;
  bool private isWorking = true;

  function startWorking() public {
    isWorking = true;
  }

  function stopWorking() public {
    isWorking = false;
  }

  function checkStatus() public view returns (string memory) {
    if (isWorking) {
      return "Working";
    } else if (isReady) {
      return "Ready";
    } else {
      return "Not ready";
    }
  }
}