// OPINIANO, EZKYLLE
// NW - 301
// 6BLOCKTECH

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openZeppelin/contracts/token/ERC20/ERC20.sol";

contract OpinianoSecCon is ERC20{

    bytes32 public secretHash;

    constructor() ERC20("BLOCK", "CON") {
        secretHash = keccak256(abi.encodePacked("BLOCK"));
    }

    function claimTokens(string memory _password, uint _amount) public {

        require(
            keccak256(abi.encodePacked(_password)) == secretHash,
            "Wrong Password"
        );
        _mint(msg.sender, _amount);
    }

}
