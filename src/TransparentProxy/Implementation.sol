// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Implementation {
    uint256 public value;
    address public owner;

    event ValueUpdated(uint256 newValue);

    constructor() {
        owner = msg.sender;
    }

    function setValue(uint256 _newValue) external {
        require(msg.sender == owner, "Not authorized");
        value = _newValue;
        emit ValueUpdated(_newValue);
    }

    function getValue() external view returns (uint256) {
        return value;
    }
}
