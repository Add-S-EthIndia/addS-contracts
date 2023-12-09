// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.23;

interface Paymaster {
    // function definition of the paymaster deposit function
    function depositFor(address paymasterId) external payable;
}

contract Pool {

    // contract address of the AdS Infra Contract
    address public owner;
    // contract address of the AdS Wallet
    address private immutable AddSWallet = 0xa5FdD3CB3792E74CAc421Aa97fbcceFC859df7B4;
    // contract address of the paymaster wallet
    // create our own paymaster
    address private immutable paymasterAddress = 0x00000f79B7FaF42EEBAdbA19aCc07cD08Af44789;

    // array to store the list of all pools
    address[] public pools;

    // constructor to store the infra contract address
    constructor(address deployer) {
        owner = deployer;
    }

    // modifier to check if the caller is Infra contract
    modifier isOwner(address caller) {
        require(caller == owner, "Unauthorized caller");
        _;
    }

    // function to get the verifier address
    function getVerifier() external view returns (address) {
        return AddSWallet;
    }

    fallback() external payable {
        Paymaster paymasterContract = Paymaster(paymasterAddress);

        paymasterContract.depositFor{value: msg.value}(AddSWallet);
    }

    receive() external payable {
        Paymaster paymasterContract = Paymaster(paymasterAddress);

        paymasterContract.depositFor{value: msg.value}(AddSWallet);
    }

}