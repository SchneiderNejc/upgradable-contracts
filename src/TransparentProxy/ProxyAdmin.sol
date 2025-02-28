// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./TransparentProxy.sol"; // Import TransparentProxy contract

contract ProxyAdmin is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}

    function upgradeProxy(
        address proxy,
        address newImplementation,
        bytes memory data
    ) public onlyOwner {
        TransparentProxy(payable(proxy)).upgradeToAndCall(
            newImplementation,
            data
        );
    }
}
