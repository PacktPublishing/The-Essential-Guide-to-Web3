// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedImmutable {
    address public immutable CONTRACT_ADDRESS;
    uint256 public immutable MAX_NUMBER;
    uint256 public immutable MIN_NUMBER;
    string public immutable CONTRACT_NAME;

    constructor(uint256 _maxNumber, uint256 _minNumber, string memory _name) {
        CONTRACT_ADDRESS = msg.sender;
        MAX_NUMBER = _maxNumber;
        MIN_NUMBER = _minNumber;
        CONTRACT_NAME = _name;
    }

    function doSomething(uint256 _number) public pure returns (bool) {
        require(
            _number >= MIN_NUMBER && _number <= MAX_NUMBER,
            "Number is out of range"
        );
        return true;
    }
}
