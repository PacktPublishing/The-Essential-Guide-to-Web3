// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Primitives {
  bool public isRegistered = true;
 
  // Unsigned integers (uint)
  uint8 public smallNumber = 2;
  uint16 public mediumNumber = 256;
  uint256 public largeNumber = 1000000;

  // Signed integers (int)
  int8 public smallNegativeNumber = -1;
  int16 public mediumNegativeNumber = -256;
  int256 public largeNegativeNumber = -1000000;

  // Minimum and Maximum of int
  int256 public minInt = type(int).min;
  int256 public maxInt = type(int).max;

  // Addresses
  address public deployerAddress = msg.sender;
  address public recipientAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

  // Bytes and byte arrays
  bytes1 public byte1a = 0xb5;
  bytes1 public byte1b = 0x56;
  bytes2 public byteArray = hex"1234";

  // Booleans
  bool public defaultBool; // false
  bool public trueBool = true;
  bool public falseBool = false;

  // Strings
  string public name = "ChatGPT";
  string public greeting = "Hello, world!";
  string public emptyString = "";

  // Enums
  enum Color {RED, GREEN, BLUE}
  Color public favoriteColor = Color.BLUE;
  Color public leastFavoriteColor = Color.RED;

  // Structs
  struct Person {
      string name;
      uint age;
  }
  Person public alice = Person("Alice", 25);
  Person public bob = Person("Bob", 30);

}