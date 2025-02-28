// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./TransparentProxy.sol"; // Import TransparentProxy contract

contract ProxyAdmin is Ownable {
    // Function to upgrade the proxy to a new implementation
    function upgrade(
    constructor(address initialOwner) Ownable(initialOwner) {}
        address proxy,
        address newImplementation
    ) external onlyOwner {
        TransparentProxy(payable(proxy)).upgradeTo(newImplementation);
    }
}
