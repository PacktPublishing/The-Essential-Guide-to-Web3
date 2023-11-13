// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyPetNFT is ERC721URIStorage {
    uint256 public tokenCounter;
    uint256 public MAX_TOKENS = 1000; // maximum supply

    constructor() ERC721("MYPET", "MPET") {
        tokenCounter = 0;
    }

    function mint(string memory _tokenUri) public payable {
        require(tokenCounter < MAX_TOKENS, "ERC721: Max supply");
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, _tokenUri);
        tokenCounter = tokenCounter + 1;
    }
}