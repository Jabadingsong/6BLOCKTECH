// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract ErrorHandling {

    mapping(address => uint256) public valueMapping;

    function setValue(uint256 _value) public {
        require(_value != 0, "Value cannot be zero");
        valueMapping[msg.sender] = _value;
    }

    function getValue() public view returns (uint256) {
        require(valueMapping[msg.sender] != 0, "No value set for sender");
        return valueMapping[msg.sender];
    }
}
