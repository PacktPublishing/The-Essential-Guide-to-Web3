// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedConstants {
    address public constant CONTRACT_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MAX_NUMBER = 1000;
    uint256 public constant MIN_NUMBER = 1;
    string public constant CONTRACT_NAME = "AdvancedConstants";

    function doSomething(uint256 _number) public pure returns (bool) {
        require(
            _number >= MIN_NUMBER && _number <= MAX_NUMBER,
            "Number is out of range"
        );
        return true;
    }
}
