// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";

contract SimpleGoldVault is ERC4626 {
    // --> The constructor takes the address of the Underlying Asset --> the ERC-20 token

    constructor(IERC20 _asset)
        ERC4626(_asset)
        ERC20("Vault Gold Shares", "vGOLD")
    {}
}
