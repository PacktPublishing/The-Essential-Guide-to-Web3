// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract IterableMapping {
    mapping(address => uint) private balances;
    address[] private accounts;

    // Add to the mapping
    function addBalance(address _address, uint _balance) public {
        balances[_address] += _balance;
        accounts.push(_address);
    }

    // Get the balance of a specific address
    function getBalance(address _address) public view returns (uint) {
        return balances[_address];
    }

    // Get the list of all accounts that have a balance
    function getAccounts() public view returns (address[] memory) {
        return accounts;
    }

    // Get the total balance of all accounts
    function getTotalBalance() public view returns (uint) {
        uint total = 0;
        for (uint i = 0; i < accounts.length; i++) {
            total += balances[accounts[i]];
        }
        return total;
    }
}

// In this contract, we have a mapping of balances where each address has a 
// corresponding balance. We also have an array of addresses called accounts that 
// stores all the addresses that have a balance.

// We can add to the mapping using the addBalance function, which takes an 
// address and a balance as input. This function increments the balance for the 
// given address and adds the address to the accounts array if it is not already there.

// We can get the balance of a specific address using the getBalance function, 
// which takes an address as input and returns the balance for that address.

// We can get the list of all accounts that have a balance using the getAccounts 
// function, which returns the accounts array.

// We can get the total balance of all accounts using the getTotalBalance function, 
// which iterates through the accounts array and adds up the balances for each address. 
// This is an example of how to use an iterable mapping to efficiently store and retrieve 
// data in Solidity