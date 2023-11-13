// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedEtherUnits {
    uint256 public oneWei = 1 wei;
    bool public isOneWei = 1 wei == 1;

    uint256 public oneEther = 1 ether;
    bool public isOneEther = 1 ether == 1e18;

    uint256 public halfEther = 0.5 ether;
    bool public isHalfEther = 0.5 ether == 5e17;

    uint256 public oneGwei = 1 gwei;
    bool public isOneGwei = 1 gwei == 1e9 wei;

    uint256 public oneFinney = 1 finney;
    bool public isOneFinney = 1 finney == 1e15 wei;
}
