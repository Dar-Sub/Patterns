// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract withdrawalPattern {

    string tatiana;
    uint balance;
    uint amount;

    modifier onlyOwner {
        require(true);
        _;
    }

function sendRefund() public onlyOwner returns(bool success) {
    if(!tatiana.send(amount)) {
        
    }
}

function claimRefund() public {
    require(balance[msg.sender] > 0);
    msg.sender.transfer(balance[msg.sender]);
}


function withdrawFunds(uint amount) public returns(bool success) {
    require(balance[msg.sender] >= amount);
    balance[msg.sender] -= amount;
    msg.sender.transfer(amount);
    return true;
}

}
