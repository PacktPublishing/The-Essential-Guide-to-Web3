// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedStorage {
    // State variables to store data
    uint256 public counter;
    string[] public names;
    mapping(string => uint256) public nameToIndex;

    // Events to notify when data is updated
    event CounterUpdated(uint256 newValue);
    event NameAdded(string newName);

    // Functions to modify data
    function incrementCounter() public {
        counter++;
        emit CounterUpdated(counter);
    }

    function addName(string memory _name) public {
        require(nameToIndex[_name] == 0, "Name already exists");
        names.push(_name);
        nameToIndex[_name] = names.length;
        emit NameAdded(_name);
    }

    // Functions to retrieve data
    function getCounter() public view returns (uint256) {
        return counter;
    }

    function getName(uint256 _index) public view returns (string memory) {
        require(_index < names.length, "Index out of range");
        return names[_index];
    }

    function getIndex(string memory _name) public view returns (uint256) {
        require(nameToIndex[_name] != 0, "Name does not exist");
        return nameToIndex[_name];
    }
}
