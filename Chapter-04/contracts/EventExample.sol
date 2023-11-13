// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract EventExample {
    // Define a custom event
    event NewPayment(uint amount, address sender);

    uint public totalPayments;

    function makePayment() public payable {
        // Increment the totalPayments count
        totalPayments++;

        // Emit the NewPayment event with the payment amount and sender address
        emit NewPayment(msg.value, msg.sender);
    }
}
