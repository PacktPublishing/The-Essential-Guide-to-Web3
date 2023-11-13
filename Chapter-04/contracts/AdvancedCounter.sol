// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedCounter {
    uint256 public count;
    address public owner;

    struct History {
        uint256 value;
        string action;
    }
    History[] public history;

    event CounterIncreased(uint256 value);
    event CounterDecreased(uint256 value);

    constructor() {
        owner = msg.sender;
    }

    // Function to get the current count
    function getCount() public view returns (uint256) {
        return count;
    }

    // Function to increment count by 1
    function increment() public {
        count += 1;
        history.push(History(count, "increment"));
        emit CounterIncreased(count);
    }

    // Function to decrement count by 1
    function decrement() public {
        require(count > 0, "Counter cannot be negative");
        count -= 1;
        history.push(History(count, "decrement"));
        emit CounterDecreased(count);
    }

    // Function to reset count to zero
    function reset() public {
        require(msg.sender == owner, "Only owner can reset the counter");
        count = 0;
        history.push(History(count, "reset"));
    }

    // Function to get history of the counter
    function getHistory() public view returns (History[] memory) {
        return history;
    }
}
