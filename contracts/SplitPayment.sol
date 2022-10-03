// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//contract that is used to split payments in one transaction to multiple addresses
//example, paying employees salaries in one trx instead of sending them one by one.
contract SplitPayment {
    address public owner;//authorized to transfer the payments
    constructor(address _owner) {
        owner = _owner;
    }

    //use send function to deposit to smart contract and also to send payments to addresses
    function send(address payable[] memory to, uint[] memory amount) payable public onlyOwner {
        require(to.length == amount.length, 'to and amount arrays must have same length');
         
        for(uint i; i < to.length; i++)
        {
            to[i].transfer(amount[i]);
        }
    }

    modifier onlyOwner() {
        require(msg.sender == owner, 'only owner can send transfers');
        _;
    }
}