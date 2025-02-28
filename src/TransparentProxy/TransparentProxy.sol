// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

/**
 * @dev Transparent Proxy for upgradeable contracts.
 * This proxy allows only the admin to upgrade the implementation.
 */
contract TransparentProxy is ERC1967Proxy {
    /**
     * @dev Initializes the transparent proxy with an initial implementation and setup data.
     * @param _logic Address of the initial implementation contract.
     * @param _data Initialization data to be passed to the implementation.
     */
    constructor(
        address _logic,
        bytes memory _data
    ) payable ERC1967Proxy(_logic, _data) {}

    /**
     * @dev Override _implementation to return the current implementation address.
     */
    function _implementation()
        internal
        view
        virtual
        override
        returns (address)
    {
        return ERC1967Utils.getImplementation();
    }

    /**
     * @dev Remove the following function in case contract should be able to receive eth.
     */
    receive() external payable {
        revert("ETH not accepted");
    }
}
