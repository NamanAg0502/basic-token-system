// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.17;

// This is the contract for a basic token system
contract Token {
    string public name;
    string public symbol;
    address public owner;
    uint256 public totalSupply;

    // The mapping of addresses to their token balance
    mapping(address => uint256) public balanceOf;

    // The event that is emitted when the token balance of an address is updated
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Constructor function that sets the name, symbol, totalSupply and owner.
    constructor(string memory _name, string memory _symbol, uint256 _totalSupply, address _owner) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        owner = _owner;
        balanceOf[msg.sender] = totalSupply;
    }

    // Function to allow the contract owner to issue more tokens
    function issueTokens(uint256 _value, address _owner) public {
        require(msg.sender == _owner, "Only the contract owner can issue tokens.");
        // Increase the total supply and the balance of the contract owner
        totalSupply += _value;
        balanceOf[msg.sender] += _value;
    }

    // Function to allow the transfer of tokens between accounts, decrease 
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance.");
        // Decrease the balance of the sender and increase the balance of the recipient
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, to, _value);
    }
}
