# Simple ERC20 Token Implementation

This is a simple implementation of an ERC20 token contract in Solidity. ERC20 is a widely used standard for creating fungible tokens on the Ethereum blockchain.

## Overview

The contract, named `MySimpleToken`, inherits from the `ERC20` contract provided by the OpenZeppelin library. It includes functions and variables required for managing tokens.

## Key Points

- SPDX License: The contract is distributed under the MIT License, a permissive open-source license.

- Solidity Version: The contract is written in Solidity and specifies that it should be compiled with a compiler version greater than or equal to 0.8.9.

- ERC20 Import: The contract imports the `ERC20` contract from the OpenZeppelin library to leverage the standard ERC20 token functionalities.

- Initial Supply: The initial total supply of tokens is set to 1,000,000 (1 million) tokens, with 18 decimals. This value is defined as `initialSupply`.

- Constructor: The contract constructor function is called during deployment. It initializes the token with the name "SimpleToken" and symbol "STKN" by calling the constructor of the parent `ERC20` contract.

- Minting: The contract creator is granted the ability to mint (create) tokens during deployment. The total supply is set to the value defined in `initialSupply`, and these tokens are assigned to the contract creator's address.

## Usage

This contract provides a basic template for creating an ERC20 token. You can customize the token name, symbol, initial supply, and other parameters as needed. To deploy and interact with the contract, you'll need a development environment, such as Remix or Truffle, and access to an Ethereum network.

Feel free to modify and extend this contract to suit your specific requirements when creating your own ERC20 tokens.

For more information on ERC20 tokens and Solidity development, refer to the [Solidity documentation](https://soliditylang.org/docs/).
