//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.0;
 
import "https://github.com/0xcert/ethereum-erc721/src/contracts/tokens/nf-token-metadata.sol";
import "https://github.com/0xcert/ethereum-erc721/src/contracts/ownership/ownable.sol";
 
contract dufuNFT is NFTokenMetadata, Ownable {
 
  constructor() {
    nftName = "Dufu NFT";
    nftSymbol = "DFN";
  }
 
  function mint(address _to, uint256 _tokenId, string calldata _uri) external onlyOwner {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
  }
 
}

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Libai is ERC20 {
    constructor() ERC20("Libai", "JIU") {
        _mint(msg.sender, 1000 * 10 ** 18);
    }
}


contract DEX is Libai,dufuNFT{

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    function buy() payable public {
        uint256 amountTobuy = msg.value;
        uint256 dexBalance = dufuNFT.balanceOf(address(this));
        require(amountTobuy > 0, "You need to send some ether");
        require(amountTobuy <= dexBalance, "Not enough tokens in the reserve");
        dufuNFT.transfer(msg.sender, amountTobuy);
        emit Bought(amountTobuy);
    }

    function sell(uint256 amount) public {
        require(amount > 0, "You need to sell at least some tokens");
        uint256 allowance = Libai.allowance(msg.sender, address(this));
        require(allowance >= amount, "Check the token allowance");
        Libai.transferFrom(msg.sender, address(this), amount);
        msg.sender.transfer(amount);
        emit Sold(amount);
    }
}
