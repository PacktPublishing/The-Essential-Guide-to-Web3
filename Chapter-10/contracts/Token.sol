// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

  

contract Token { 

    mapping(address => uint256) public balanceOf; 

  

    event Transfer(address indexed from, address indexed to, uint256 value); 

  

    function transfer(address to, uint256 value) public { 

        require(balanceOf[msg.sender] >= value, "Insufficient balance"); 

        balanceOf[msg.sender] -= value; 

        balanceOf[to] += value; 

        emit Transfer(msg.sender, to, value); 

    } 

} 