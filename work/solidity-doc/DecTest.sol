// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Dex{
    using SafeMath for uint;
    address public token1;
    address public token2;

    constructor(address _token1,address _token2){
        token1 = _token1;
        token2 = _token2;
    }

    function swap(address from,address to, uint amount) public {
        require((from == token1 && to == token2)||(from == token2 && to == token1),"Invalid tokens");
        require(SwappableToken(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
        uint swap_amount = get_swap_price(from, to, amount);

        SwappableToken(from).transferFrom(msg.sender,address(this),amount);
        SwappableToken(to).approve(address(this),swap_amount);
        SwappableToken(to).transferFrom(address(this),msg.sender,swap_amount);
        
    }

    function add_liquidity(address token_address, uint amount) public {

        SwappableToken(token_address).transferFrom(msg.sender, address(this), amount);
    }

    function get_swap_price(address from, address to, uint amount) public view returns(uint){
        return ((amount * SwappableToken(to).balanceOf(address(this)))/SwappableToken(from).balanceOf(address(this)));
    }

    function approve(address spender, uint amount) public {
      SwappableToken(token1).approve(spender, amount);
      SwappableToken(token2).approve(spender, amount);
    }

    function balanceOf(address token, address account) public view returns (uint){
    return IERC20(token).balanceOf(account);
    }
    receive() external payable{}

    
}

contract SwappableToken is ERC20 {
  constructor(string memory name, string memory symbol, uint initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
  }
}
/*token1地址：
0xa6510f8afCA2cA2C1fB90A574d33E6225b58F72B
token2地址：
0x45a891f4916cda56b33932519a30ed193d7ee9f6
DEX合约地址：
0x5A4F3305f054E6B97956a77E473ff1B165cac39E
0xD8041FB0d27f0697235E5224853a6ea53C94b74c

*/