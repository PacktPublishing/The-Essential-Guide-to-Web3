//Here is an example of a Proxy Factory Contract:
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ProxyFactory {
  event ContractDeployed(address deployedAddress, address proxyAddress);

  function createProxyContract(bytes memory contractData) public returns (address) {
    address deployedAddress;
    assembly {
      deployedAddress := create(0, add(contractData, 0x20), mload(contractData))
    }

    ProxyContract proxy = new ProxyContract(deployedAddress);
    emit ContractDeployed(deployedAddress, address(proxy));
    return address(proxy);
  }
}

contract ProxyContract {
  address public targetContract;

  constructor(address _targetContract) public {
    targetContract = _targetContract;
  }

  function() payable external {
    assembly {
      let ptr := mload(0x40)
      calldatacopy(ptr, 0, calldatasize())
      let result := delegatecall(gas(), sload(targetContract.slot), ptr, calldatasize(), 0, 0)
      let size := returndatasize()
      returndatacopy(ptr, 0, size)
      switch result
      case 0 { revert(ptr, size) }
      default { return(ptr, size) }
    }
  }
}