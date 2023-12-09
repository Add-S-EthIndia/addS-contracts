// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.23;

interface PoolFactory {
    function getPoolsList() external view returns (address[] memory pools);
    function getIntegratorsList() external view returns (string[] memory);
    function getAdDetails(string calldata walletName) external view returns(string memory);
}

contract AddSInfra {

    address private _factoryContractAddress;

    constructor(address factoryContract) {
        _factoryContractAddress = factoryContract;
    }

    // function to get the advertiser data against their wallet address
    function getPoolsList() external view returns (address[] memory ) {
        PoolFactory factoryContract = PoolFactory(_factoryContractAddress);

        address[] memory pools = factoryContract.getPoolsList();

        return pools;
    }

    // function to get the advertiser data against their wallet address
    function getIntegratorsList() external view returns (string[] memory) {
        PoolFactory factoryContract = PoolFactory(_factoryContractAddress);

        string[] memory integrators = factoryContract.getIntegratorsList();

        return integrators;
    }

    // function to get the advertiser data against their wallet address
    function getAdDetails(string calldata walletName) external view returns (string memory ) {
        PoolFactory factoryContract = PoolFactory(_factoryContractAddress);

        string memory adDetails = factoryContract.getAdDetails(walletName);

        return adDetails;
    }

}
