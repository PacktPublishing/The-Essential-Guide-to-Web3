// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ErrorHandling {
// Use require to validate inputs or conditions before execution
    function validateInput(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    // Use revert for complex validation or to return custom error messages
    function complexValidation(uint _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public balance;

    // Use assert to check for invariants or internal errors
    function checkInvariant() public view {
        assert(balance == 0);
    }

    // Create custom errors to provide more information about errors
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function withdraw(uint _withdrawAmount) public view {
        if (balance < _withdrawAmount) {
            // Use custom error to return more information about the error
            revert InsufficientBalance({balance: balance, withdrawAmount: _withdrawAmount});
        }
    }
}
}
