//Here is an example of a Simple Factory Contract:

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract SimpleFactory {
  function createNewContract(uint256 initialData) public returns (address) {
    return address(new MyContract(initialData));
  }
}

contract MyContract {
  uint256 public data;

  constructor(uint256 initialData) public {
    data = initialData;
  }
}

