# **Sepolia Ethereum Pet Shop**


**Try running some of the following tasks:**
<br/>

- To Deploy Contract in localhost :
    - Open a terminal in the working directory and run :
        ```shell
        npx hardhat compile
        ```

- To Deploy Contract in Sepolia:
    - Run the following command
        ```shell
        npx hardhat run scripts/deploy.js --network sepolia
        ```

- To use DApp:
    - Update ```contractAddress```  in ```src/pages/index.js```
    - Run the following command
        ```shell
        npm run dev
        ```
    - open localhost and interact with the DApp


---



# Pet Adoption Smart Contract

This is a simple Ethereum smart contract for pet adoption, written in Solidity. The contract allows users to adopt pets by associating their Ethereum addresses with specific pets and provides a function to retrieve the list of pet adopters.


## Solidity Version

The contract is written in Solidity and specifies that it should be compatible with Solidity version **0.8.19** or higher.

## Contract Overview

The contract, named **Adoption**, defines the behavior and data structures for a pet adoption system. It maintains an array called **adopters**, which can hold 12 Ethereum addresses, representing pet adopters. The array is publicly readable, allowing anyone to view the list of adopters.

### Functions

1. **adopt(uint petId)**
   - This function is used to adopt a pet by specifying its unique identifier, `petId`.
   - It ensures that the provided `petId` is within the valid range of 0 to 11 using a `require` statement.
   - The Ethereum address of the person calling the function (`msg.sender`) is stored in the `adopters` array at the index specified by `petId`, marking the pet as adopted.
   - The function returns the adopted `petId` as an unsigned integer.

2. **getAdopters()**
   - This function retrieves the list of pet adopters.
   - It returns the `adopters` array, which contains Ethereum addresses associated with adopted pets.
   - The function is publicly viewable, allowing anyone to read the list of pet adopters.

## Usage

This smart contract provides a basic foundation for a pet adoption system on the Ethereum blockchain. Users can adopt pets by interacting with the `adopt` function, and the list of pet adopters can be obtained through the `getAdopters` function.

To deploy and interact with this contract, you'll need a development environment like Remix or Truffle and access to an Ethereum network.

Feel free to modify and extend this contract to suit your specific requirements for a pet adoption system on the blockchain.

For more information on Solidity and Ethereum smart contracts, refer to the [Solidity documentation](https://soliditylang.org/docs/).
