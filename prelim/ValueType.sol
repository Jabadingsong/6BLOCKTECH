// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Data type - values and references

contract ValueTypes {
    bool public b = true;
    uint public u = 123;

    int public i = -123;

    int public minInt = type(int).min;
    int public maxInt = type(int).max;
    address public addr = 0xf6ac838863A3031Bc9c0a1AB751199995f0F2d73;
    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4    
}