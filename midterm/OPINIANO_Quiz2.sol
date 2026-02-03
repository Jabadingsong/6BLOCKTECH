// Opiniano, Ezkylle
// NW - 301

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStringHash {

    // User metadata
    string public fullName;

    // Outputs
    string public extracted;
    bytes32 public hashEncode;
    bytes32 public hashPacked;

    constructor(string memory _fullName) {
        fullName = _fullName;
    }

    function process(
        string memory barangay,
        string memory city,
        string memory province,
        string memory country
    ) public {
        // Convert to bytes for indexing
        bytes memory b1 = bytes(barangay);
        bytes memory b2 = bytes(city);
        bytes memory b3 = bytes(province);
        bytes memory b4 = bytes(country);

        // Extract required characters
        string memory result = string(
            abi.encodePacked(
                b1[0], b1[1],               // first 2 of Barangay
                b2[0], b2[1],               // first 2 of City
                b3[b3.length - 2], b3[b3.length - 1], // last 2 of Province
                b4[b4.length - 2], b4[b4.length - 1]  // last 2 of Country
            )
        );

        extracted = result;

        // Hashing
        hashEncode = keccak256(
            abi.encode(result)
        );

        hashPacked = keccak256(
            abi.encodePacked(result)
        );
    }
}
