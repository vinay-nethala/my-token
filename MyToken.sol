// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token metadata - these store the name, symbol, and decimal precision
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping to track balances: address => balance
    // This acts like a ledger: "Address A owns X tokens"
    mapping(address => uint256) public balanceOf;

    // Nested mapping for allowances: owner => (spender => amount)
    // This tracks if Address A has approved Address B to spend X tokens
    mapping(address => mapping(address => uint256)) public allowance;
// Event emitted when tokens are transferred
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Event emitted when allowance is set
    event Approval(address indexed owner, address indexed spender, uint256 value);
    // Constructor to initialize total supply and assign to creator
    // This runs only once when you deploy the contract
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        // Assign the entire supply to the person deploying the contract (msg.sender)
        balanceOf[msg.sender] = _initialSupply;
    }
    // Function to transfer tokens from the caller (msg.sender) to another address
    function transfer(address _to, uint256 _value) public returns (bool success) {
        // 1. Validation: Prevent burning tokens to the zero address
        require(_to != address(0), "Cannot transfer to zero address");
        
        // 2. Validation: Check if the sender has enough money
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        
        // 3. Update State: Subtract from sender, add to receiver
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        
        // 4. Emit Event: Tell the blockchain a transfer happened
        emit Transfer(msg.sender, _to, _value);
        
        return true;
    }
    // Function to approve another address to spend tokens on your behalf
    function approve(address _spender, uint256 _value) public returns (bool success) {
        // 1. Validation: Prevent approving the zero address
        require(_spender != address(0), "Cannot approve zero address");
        
        // 2. Update State: Set the allowance for the spender
        allowance[msg.sender][_spender] = _value;
        
        // 3. Emit Event: Tell the blockchain an approval happened
        emit Approval(msg.sender, _spender, _value);
        
        return true;
    }
    // Function to transfer tokens from one address to another using allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        // 1. Validation: Prevent transfer to zero address
        require(_to != address(0), "Cannot transfer to zero address");
        
        // 2. Validation: Check if the owner (_from) has enough money
        require(balanceOf[_from] >= _value, "Insufficient balance");
        
        // 3. Validation: Check if the caller (msg.sender) has enough allowance from the owner
        require(allowance[_from][msg.sender] >= _value, "Insufficient allowance");
        
        // 4. Update State: Move tokens from owner to recipient
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        
        // 5. Update Allowance: Reduce the allowance by the amount spent
        allowance[_from][msg.sender] -= _value;
        
        // 6. Emit Event
        emit Transfer(_from, _to, _value);
        
        return true;
    }
    // Helper: Get total supply
    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    // Helper: Get all token info in one call
    function getTokenInfo() public view returns (string memory, string memory, uint8, uint256) {
        return (name, symbol, decimals, totalSupply);
    }
}