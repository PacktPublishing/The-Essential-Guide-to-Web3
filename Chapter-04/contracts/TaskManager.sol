// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract TaskManager {
    constructor() public {}

    struct Task {
        string taskName;
        bool completed;
    }
    Task[] public tasks;

    function createTask(string calldata _taskName) public {
        tasks.push(Task(_taskName, false));
    }

    function getTask(
        uint _index
    ) public view returns (string memory taskName, bool completed) {
        Task storage task = tasks[_index];
        return (task.taskName, task.completed);
    }

    function updateTaskName(uint _index, string calldata _taskName) public {
        Task storage task = tasks[_index];
        task.taskName = _taskName;
    }

    function toggleCompleted(uint _index) public {
        Task storage task = tasks[_index];
        task.completed = !task.completed;
    }
}
