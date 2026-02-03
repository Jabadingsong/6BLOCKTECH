// Opiniano, Ezkylle
// NW - 301
// PC #38

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ServiceFeeCalculator {
    struct ServiceResult {
        uint256 totalFee;
        bytes32 hashValue;
    }

    uint256 constant CONSULT_FEE = 20000;
    uint256 constant DOC_FEE = 3000;
    uint256 constant TAX = 15;
    uint256 constant SERVICE_CHARGE = 8;

    function calculateService(
        string memory firstName,
        string memory middleName,
        string memory lastName,
        uint8 serviceCode
    ) public pure returns (ServiceResult memory) {

        require(serviceCode == 1 || serviceCode == 2, "Invalid service code");

        uint256 totalFee = serviceCode == 1
            ? CONSULT_FEE + (CONSULT_FEE * TAX) / 100
            : _documentFee();

        bytes memory FirstName = bytes(firstName);
        bytes memory MiddleName = bytes(middleName);
        bytes memory LastName = bytes(lastName);

        uint256 firstDigit = _firstDigit(totalFee);

        bytes32 hashValue = keccak256(
            abi.encodePacked(
                FirstName[FirstName.length - 1],
                MiddleName[0],
                LastName[LastName.length - 1],
                serviceCode,
                firstDigit
            )
        );

        return ServiceResult(totalFee, hashValue);
    }

    function _documentFee() private pure returns (uint256) {
        uint256 withCharge = DOC_FEE + (DOC_FEE * SERVICE_CHARGE) / 100;
        return withCharge + (withCharge * TAX) / 100;
    }

    function _firstDigit(uint256 value) private pure returns (uint256) {
        while (value >= 10) {
            value /= 10;
        }
        return value;
    }
}
