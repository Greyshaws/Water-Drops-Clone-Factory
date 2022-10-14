// SPDX-License-Identifier: Business Source License
pragma solidity ^0.8.9;

import "@optionality/clone-factory/blob/master/contracts/CloneFactory.sol";

contract WaterDropsFactory {
    address public waterDropsAddress;

    constructor(address _waterDropsAddress){
        waterDropsAddress = _waterDropsAddress;
    }

    function forward() external returns (bytes memory){
        (bool success, bytes memory data) = waterDropsAddress.delegatecall(msg.data);
        require(success);
        return data;
    }
}