# MyPetNFT Contract explained Line by Line


Here's a line-by-line detailed explanation of the provided Solidity contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
```

- This section includes SPDX-License-Identifier, which specifies the license under which the contract code is released. In this case, it's MIT, which is a permissive open-source license.
- The `pragma solidity ^0.8.20;` statement specifies the minimum required Solidity compiler version. The caret (^) symbol means the contract is compatible with any 0.8.x version but not compatible with 0.9.0 and above.
- The `import` statement imports the ERC721URIStorage extension from the OpenZeppelin library. This extension provides the ERC721 token standard with URI storage capabilities, allowing each token to have associated metadata.

```solidity
contract MyPetNFT is ERC721URIStorage {
```

- Here, a new Solidity contract named `MyPetNFT` is defined, and it inherits from `ERC721URIStorage`. This means that `MyPetNFT` is an ERC721 token with the added functionality to store and retrieve URIs (Uniform Resource Identifiers), typically pointing to token metadata.

```solidity
    uint256 public tokenCounter;
    uint256 public MAX_TOKENS = 1000; // maximum supply
```

- Two state variables are declared:
  - `tokenCounter` is a public unsigned integer (uint256) variable that keeps track of the total number of tokens minted.
  - `MAX_TOKENS` is a public constant unsigned integer (uint256) variable representing the maximum supply of tokens. In this contract, it's set to 1000.

```solidity
    constructor() ERC721("MYPET", "MPET") {
        tokenCounter = 0;
    }
```

- The contract constructor is defined. It runs once when the contract is deployed.
- Inside the constructor:
  - The `ERC721` constructor is called with two arguments: "MYPET" (the token's name) and "MPET" (the token's symbol). This sets up the basic ERC721 metadata for the token.
  - `tokenCounter` is initialized to 0.

```solidity
    function mint(string memory _tokenUri) public payable {
```

- A public function named `mint` is defined, allowing anyone to mint a new token.
- It takes one argument, `_tokenUri`, a string representing the URI of the token's associated metadata.
- The function is marked as `payable`, meaning it can receive Ether (though in this case, it doesn't handle Ether).

```solidity
        require(tokenCounter < MAX_TOKENS, "ERC721: Max supply");
```

- This line checks if the `tokenCounter` is less than `MAX_TOKENS`, ensuring that the maximum supply limit has not been reached. If the limit is reached, the function will revert with the error message "ERC721: Max supply."

```solidity
        _safeMint(msg.sender, tokenCounter);
```

- `_safeMint` is a function provided by the `ERC721URIStorage` contract. It is used to mint a new token to the `msg.sender` (the caller of the function).
- The `tokenCounter` is used as the token's unique identifier.

```solidity
        _setTokenURI(tokenCounter, _tokenUri);
```

- `_setTokenURI` is another function from the `ERC721URIStorage` contract. It associates the provided `_tokenUri` with the newly minted token.
- This allows the token to have metadata associated with it, typically stored off-chain at the specified URI.

```solidity
        tokenCounter = tokenCounter + 1;
    }
}
```

- After successfully minting a new token, `tokenCounter` is incremented by 1, ensuring that each newly minted token receives a unique ID.
- The function concludes, and the newly minted token is now owned by the caller of the `mint` function with the associated metadata URI.

This contract allows users to mint new ERC721 tokens with associated metadata URIs until the maximum supply (`MAX_TOKENS`) is reached. It provides a basic framework for creating NFTs with the name "MYPET" and symbol "MPET."