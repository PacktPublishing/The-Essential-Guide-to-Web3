// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Shipping {
    constructor() public {}

    enum Status {
        Pending,
        Shipped,
        Delivered,
        Rejected,
        Canceled
    }
    Status public status;

    function getStatus() public view returns (Status) {
        return status;
    }

    function setStatus(Status _status) public {
        status = _status;
    }

    function ship() public {
        status = Status.Shipped;
    }

    function deliver() public {
        status = Status.Delivered;
    }

    function reject() public {
        status = Status.Rejected;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reset() public {
        delete status;
    }
}
