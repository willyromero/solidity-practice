// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/utils/Strings.sol";

contract TaskContract {
    uint256 nextId;

    struct Task {
        uint256 id;
        string name;
        string description;
    }

    Task[] tasks;

    function createTask(string memory _name, string memory _description)
        public
    {
        tasks.push(Task(nextId, _name, _description));
        nextId++;
    }

    function findIndex(uint256 _id) internal view returns (uint256) {
        for (uint256 i = 0; i < tasks.length; i++) {
            if (tasks[i].id == _id) {
                return i;
            }
        }
        revert("Task not foud");
    }

    function readTask(uint256 _id)
        public
        view
        returns (
            uint256,
            string memory,
            string memory
        )
    {
        uint256 index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

    function updateTask(
        uint256 _id,
        string memory _name,
        string memory _description
    ) public {
        uint256 index = findIndex(_id);
        tasks[index].name = _name;
        tasks[index].description = _description;
    }

    function deleteTask(uint256 _id) public {
        uint256 index = findIndex(_id);
        delete tasks[index];
      
    }

    function countTasks() public view returns (uint) {
        return tasks.length;
    }
}
