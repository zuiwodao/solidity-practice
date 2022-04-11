pragma solidity >=0.7.0 <0.9.0;

contract Coin {
    address public miner;
    mapping (address => uint) public balance;

    event Sent(address from,address to,uint amount);

    constructor () {
        miner = msg.sender;
    }

    function mint(address receiver,uint amount) public {
        require( miner == msg.sender);
        require( amount < 1e60);
        balance[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balance[msg.sender], "Insufficient balance.");
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}