/*
We can use boolean variables to make decisions based on logical conditions, like so:
*/


// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyContract02 {
  uint256 public value = 10;
  bool public isGreater = value > 5;
}