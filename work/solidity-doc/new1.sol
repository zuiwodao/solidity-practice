//来源：https://ethereum.org/zh/developers/tutorials/transfers-and-approval-of-erc-20-tokens-from-a-solidity-smart-contract/
//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC20 {//代币接口
    
    function getAddress() external view returns(address);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address owner, address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}


contract ERC20Basic is IERC20 {

    string public constant name = "libai";
    string public constant symbol = "jiu";
    uint8 public constant decimals = 18;


    //event EApproval(address indexed tokenOwner, address indexed spender, uint value);
   // event ETransfer(address indexed from, address indexed to, uint value);


    mapping(address => uint256) balances;

    mapping(address => mapping (address => uint256)) allowed;//嵌套mapping

    uint256 totalSupply_ = 10 ether;

    using SafeMath for uint256;

   constructor()  {
    balances[msg.sender] = totalSupply_;
    }
    
    function getAddress() public override view returns(address){
        return address(this);
    }

    function totalSupply() public override view returns (uint256) {
    return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
//允许delegate，划走numTokens的代币
    function approve(address owner, address delegate, uint256 numTokens) public override returns (bool) {
        allowed[owner][delegate] = numTokens;
        emit Approval(owner, delegate, numTokens);
        return true;
    }
//可以获取delegate可以划走的金额
    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][buyer] = allowed[owner][buyer].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
    
}

library SafeMath {
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}

contract DEX {

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    IERC20 public token;

    constructor()  {
        token = new ERC20Basic();
    }

    function buy() payable public {
        uint256 amountTobuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));//合约拥有代币数量
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        token.transfer(msg.sender, amountTobuy);
        emit Bought(amountTobuy);
    }

    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        token.transferFrom(msg.sender, address(this), amount);
        //                  这是卖方       买方          金额
     //   msg.sender.transfer(amount);
        emit Sold(amount);
    }
//以下新增加

    function getDexBalance() public view returns(uint256){
        return token.balanceOf(address(this));
    }

    function getOwnerBalance() public view returns(uint){
        return token.balanceOf(address(msg.sender));
    }

    function getAddress() public view returns(address){//合约地址
        return address(this);
    }

    function getTokenAddress() public view returns(address){//token合约地址
        return token.getAddress();
    }
//总供应量
    function getTotalSupply() public view returns(uint){
        return token.totalSupply();
    }

    function getSenderAddress() public view returns(address){
        return address(msg.sender);
    }

    function getAllowance() public view returns(uint){
        uint allowance = token.allowance(msg.sender, address(this));
        return allowance;
    }

    function approve(uint amount) public returns(bool){
        bool isApprove = token.approve(msg.sender,address(this),amount);
    }

 /*   function approve(address owner, address delegate, uint256 numTokens) public  returns(bool) {
        return token.approve(owner, delegate, numTokens);
    }
*/
}
/*dex合约地址：0x5D2064A3e14e566479521933bC5E89C5B8b41cF8
  调用者地址：0x7813aFAc107B6f52AFC7d88D5C692944B1adE323   外部账户
  外部账户拥有token：0
  dex拥有全部代币
  token合约地址：0x5A646a2bE2e427335dF4607661fd5ca02442D80f
*/