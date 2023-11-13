// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract PayableExample {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    // This function is marked as payable, meaning it can receive Ether
    function deposit() public payable {
        // do something with the Ether received
    }

    // This function is marked as payable and returns Ether back to the caller
    function withdraw(uint amount) public payable {
        // check if the caller has enough balance to withdraw
        require(msg.sender.balance >= amount, "Not enough balance");

        // transfer Ether back to the caller
        payable(msg.sender).transfer(amount);
    }

    // This function is marked as payable and sends Ether to another address
    function sendEther(address payable recipient, uint amount) public payable {
        // check if the contract has enough balance to send
        require(address(this).balance >= amount, "Not enough balance");

        // transfer Ether to the recipient
        recipient.transfer(amount);
    }
}

/**

In this example, we have a contract called PayableExample. The contract has an owner variable that is marked as payable 
because we want to be able to receive Ether on the contract address.

The deposit function is marked as payable because we want to be able to receive Ether when calling this 
function. When calling this function, the sender can attach some Ether to the transaction, and the function can do 
something with it, such as storing it in a variable.

The withdraw function is also marked as payable, but this time, it returns Ether back to the caller.
The function first checks if the caller has enough balance to withdraw the requested amount, and if yes,
it transfers the requested amount back to the caller using the transfer function on the payable address of the caller.

The sendEther function is marked as payable, and it sends Ether to another payable address that is passed as a parameter.
The function first checks if the contract has enough balance to send the requested amount, and if yes, it transfers the 
requested amount to the recipient address using the transfer function on the payable address of the recipient.

In summary, marking a function as payable allows it to receive Ether, and marking a variable as payable allows it 
to hold Ether. The payable modifier is used to indicate that the function or variable can interact with Ether.

 */