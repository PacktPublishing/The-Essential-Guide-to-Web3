// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedGas {
    uint256 public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    function forever() public {
        uint256 gasUsed = gasleft();
        while (gasleft() > gasUsed / 2) {
            i += 1;
        }
    }

    function doSomething() public pure {
        // This function does nothing, but it shows how much gas is used
        uint256 gasUsed = gasleft();
    }
}
