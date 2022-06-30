// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

    // OnlyOwner
    // OnlyBy
    // OnlyAfter
    // Cost

contract RestrictedAccess {
    
    address public owner = msg.sender;
    uint public creationTime = block.timestamp;

    // Currently inactive
    // modifier onlyOwner {
    //     require(true);
    //     _;
    // }

    modifier onlyBy(address _account) {
        require(msg.sender == _account,
        'Sender not authorized!');
        _;
    }

    modifier onlyAfter(uint _time) {
        require(block.timestamp >= _time,
        'Function is called too early!');
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= _amount,
        'Not enough Ether provided!');
        _;
    }

    function changeOwnerAddress(address _newAddress) public onlyBy(owner) {
        owner = _newAddress;
    }


    // Disown and delete the current owner with OnlyOwner and OnlyAfter
    function disown() onlyBy(owner) onlyAfter(creationTime + 3 weeks) public {
        delete owner;
    }

    function forceOwnerChange(address _newOwner) payable public costs(200 ether) {
        owner = _newOwner;
    }
}
