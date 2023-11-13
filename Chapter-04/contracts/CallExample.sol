// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;


contract CallExample {
    function foo(address payable _to) public payable {
        // Call the `bar` function of the contract at address `_to`
        // with the specified value and arguments.
        (bool success, bytes memory data) = _to.call{value: msg.value}(
            abi.encodeWithSignature("bar(string)", "hello")
        );
        
        // Check if the call was successful.
        require(success, "Call failed");
        
        // Process the returned data.
        // ...
    }
}

contract CalledContract {
    uint public x;
    
    function bar(string memory _s) public payable {
        // Do something with the passed argument.
        // ...
        
        // Update the state variable.
        x = 42;
        
        // Return some data.
        // ...
    }
}

/**
In this example, we have two contracts: CallExample and CalledContract. CallExample has a function foo that takes an 
address payable argument and sends a transaction to the contract at that address using the call function. 
The value field of the call function specifies the amount of Ether to send with the call. The data field of the call function contains the encoded function signature and arguments of the function to call on the destination contract.

In the CalledContract, we have a function bar that updates a state variable x and takes an argument of type string. 
When CallExample calls the bar function using the call function, the function will be executed on the destination contract
and any Ether sent with the call will be added to the contract's balance. The call function returns a tuple of a boolean 
value indicating whether the call was successful and a bytes array containing any data returned by the function.

In this example, we also use the require statement to check if the call was successful. If the call fails, the transaction 
will be reverted and any changes made to the contract's state will be rolled back. Finally, the returned data can be processed by 
the calling contract.

Note that the call function is a low-level function and can be dangerous if used incorrectly. It is recommended to use higher-level 
functions such as send or transfer whenever possible.

 */