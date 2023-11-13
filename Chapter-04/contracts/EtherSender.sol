// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract EtherSender {
    // Define a payable function to receive Ether
    receive() external payable {}

    // Define a function that uses the transfer function to send Ether
    function sendEtherWithTransfer(address payable _to) public payable {
        // Send the specified amount of Ether to the recipient using the transfer function
        _to.transfer(msg.value);
    }

    // Define a function that uses the send function to send Ether
    function sendEtherWithSend(address payable _to) public payable {
        // Send the specified amount of Ether to the recipient using the send function
        // The send function returns a boolean value indicating whether the transfer was successful
        bool success = _to.send(msg.value);
        require(success, "Transfer failed.");
    }

    // Define a function that uses the call function to send Ether
    function sendEtherWithCall(address payable _to) public payable {
        // Define the function signature and parameter types for the recipient function that will be called
        bytes4 signature = bytes4(keccak256(bytes("receiveEther(uint256)")));
        uint256 amount = msg.value;

        // Call the recipient function using the call function
        // The call function returns a boolean value indicating whether the call was successful
        (bool success, ) = _to.call{value: amount}(
            abi.encodeWithSignature(signature, amount)
        );
        require(success, "Call failed.");
    }
}

contract EtherRecipient {
    // Define a function to receive Ether
    function receiveEther(uint256 _amount) external payable {}
}

/**

In this example, there are two contracts: EtherSender and EtherRecipient. EtherSender is used to demonstrate the different
ways to send Ether, while EtherRecipient is used to receive Ether.

The EtherSender contract includes three functions: sendEtherWithTransfer, sendEtherWithSend, 
and sendEtherWithCall. These functions use the transfer, send, and call functions, respectively, to send Ether to
the recipient address.

The EtherRecipient contract includes a receiveEther function, which is used to receive Ether from the EtherSender contract.

Note that in the sendEtherWithSend and sendEtherWithCall functions, a require statement is
used to check whether the transfer or call was successful. This is important to prevent the contract
from continuing execution if the transfer or call fails.

Also note that the call function is used with the abi.encodeWithSignature function to specify the 
function signature and parameters for the recipient function that will be called. This is necessary because 
the call function can be used to call any function on the recipient contract, and so the function signature and 
parameters must be specified explicitly.

 */
