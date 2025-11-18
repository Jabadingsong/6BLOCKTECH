// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ViewAndPureFuntions {
    uint public num;

    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function getBalance(address account) public view returns (uint) {
        return account.balance;
    }

    function multiply(uint a, uint b) internal pure returns (uint) {
        return a * b;
    }
}