// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Adoption {

    address[12] public adopters;

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 11);

        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[12] memory) {
    return adopters;
    }


}
