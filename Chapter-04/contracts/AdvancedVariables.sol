// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedVariables {
    // State variables are stored on the blockchain.
    string public greeting = "Hello";
    uint256 public number = 123;
    address public owner;
    uint256[] public numberArray;
    mapping(string => uint256) public namedNumbers;

    event NewNumberAdded(uint256 numberAdded);

    constructor() {
        owner = msg.sender;
    }

    function addNumber(uint256 _number) public {
        require(msg.sender == owner, "Only owner can add numbers");
        numberArray.push(_number);
        namedNumbers["lastNumberAdded"] = _number;
        emit NewNumberAdded(_number);
    }

    function getNumber(uint256 _index) public view returns (uint256) {
        require(_index < numberArray.length, "Index out of range");
        return numberArray[_index];
    }

    function getNamedNumber(string memory _name) public view returns (uint256) {
        return namedNumbers[_name];
    }

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint256 i = 456;

        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }
}//