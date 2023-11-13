// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedArray {
    constructor() public {}

    uint256[] public myArray;
    uint256[] public myArray2 = [1, 2, 3];
    uint256[10] public myFixedSizeArray;

    function getValue(uint256 _index) public view returns (uint256) {
        return myArray[_index];
    }

    function getArray() public view returns (uint256[] memory) {
        return myArray;
    }

    function pushValue(uint256 _value) public {
        myArray.push(_value);
    }

    function popValue() public {
        myArray.pop();
    }

    function getLength() public view returns (uint256) {
        return myArray.length;
    }

    function removeValue(uint256 _index) public {
        if (_index >= myArray.length) return;

        for (uint256 i = _index; i < myArray.length - 1; i++) {
            myArray[i] = myArray[i + 1];
        }
        myArray.pop();
    }

    function concatenateArrays(
        uint256[] memory _array1,
        uint256[] memory _array2
    ) public pure returns (uint256[] memory) {
        uint256[] memory result = new uint256[](
            _array1.length + _array2.length
        );

        for (uint256 i = 0; i < _array1.length; i++) {
            result[i] = _array1[i];
        }
        for (uint256 i = 0; i < _array2.length; i++) {
            result[_array1.length + i] = _array2[i];
        }

        return result;
    }
}
