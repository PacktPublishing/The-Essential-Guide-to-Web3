/**
Here is an example of how to use some of these member functions in Solidity:


 */
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyContract05 {
  address payable public myAddress = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
  
  function getBalance() public view returns (uint256) {
    return myAddress.balance;
  }
  
  function sendEther() public payable {
    myAddress.transfer(msg.value);
  }
}