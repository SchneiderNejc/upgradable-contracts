Introduction to Upgradable Smart Contracts

Why Upgradable Smart Contracts?

Smart contracts deployed on the blockchain are immutable by default. While immutability provides security and trustlessness, it also means that bugs, inefficiencies, or the need for improvements require deploying entirely new contracts. Upgradable smart contracts solve this problem by enabling modifications while maintaining state and user interactions.

Common Proxy Patterns

Upgradable contracts are typically implemented using proxy patterns. The key idea is to separate contract logic from storage by utilizing a proxy contract that delegates calls to an implementation contract. This allows the logic to be replaced without affecting stored data.

Key Proxy Patterns:

Eternal Storage Pattern
Stores contract logic in a separate contract while keeping all data in a dedicated storage contract.
Rarely used today due to inefficiency and complexity.

Delegatecall Proxy Pattern (Unstructured Storage)
Uses a proxy contract with delegatecall to execute logic from an implementation contract.
Data layout issues make it risky for upgrades.

Transparent Proxy Pattern (EIP-1967 + EIP-897)
Uses a proxy with an admin that can upgrade it, while regular users interact with the implementation.
Admin cannot directly interact with the logic contract.
Recommended for simple use cases.

UUPS (Universal Upgradeable Proxy Standard) (EIP-1822)
More gas-efficient than the transparent proxy by placing upgrade logic in the implementation itself.
Requires implementation contracts to include upgrade functions.
Recommended for more control and flexibility.

Beacon Proxy Pattern (EIP-1967 + EIP-1971)
A beacon contract manages implementation logic for multiple proxies.
Useful for deploying many similar upgradable contracts.

Metamorphic Contracts
Uses self-destruct and redeployment to enable upgrades.
Non-standard and riskier.

Diamond Standard (EIP-2535)
Supports modular contract logic via facets.
Ideal for large-scale contracts with complex upgrade needs.

Security Considerations

While upgradable contracts offer flexibility, they introduce additional risks:

Storage Collision – Upgrading an implementation may unintentionally alter storage layout. Proper storage slot management (e.g., ERC-1967) is crucial.

Access Control – Only trusted parties should have permission to upgrade contracts to prevent malicious modifications.

Proxy Selector Clashes – Ensuring function selectors in the proxy contract do not interfere with delegated calls.

Project Structure

This repository will include:

Implementations of different proxy patterns.

Test cases to verify upgradeability mechanisms.

Scripts to deploy, interact with, and upgrade contracts.

Documentation covering standards, best practices, and security guidelines.

---

ERC Standards

ERC-1967 is a standard for upgradeable proxies, defining fixed storage slots for key data:

Implementation Slot: Stores the address of the current logic contract.
Admin Slot: Stores the admin's address who can upgrade the implementation.
Beacon Slot: Used for proxies that rely on a beacon contract.
It ensures secure and consistent upgradeability of proxy contracts.

ERC-897 defines a transparent proxy pattern for upgradeable contracts. It separates the proxy logic and implementation logic with the following:

Proxy Contract: Forwards calls to the implementation and contains state.
Admin Role: Only the admin can upgrade the proxy.
Fallback Mechanism: Forwards calls to the implementation using delegatecall.
It provides a simpler proxy structure with clear upgradeability control.
