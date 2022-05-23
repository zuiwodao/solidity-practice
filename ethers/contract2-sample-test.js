const { expect } = require("chai");
const { ethers,Contract } = require("hardhat");
//学习contract

describe("Ethers", function () {
  it("For contract", async function () {
    
    const address = "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9";
    const addressOwner = "0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266";
    const addressTo = "0x70997970C51812dc3A010C7d01b50e0d17dc79C8";
    /*
     //for hardhat
    const contract = await ethers.getContractAt("MyToken", address);
    console.log("contract name:", await contract.name());
    */
    //for ethers
    const provider = new ethers.providers.JsonRpcProvider();
    const abi = [
      "function name() view returns(string)",
      "function symbol() view returns(string)",
      "function balanceOf(address owner) view returns(uint256)",
      "function transfer(address to, uint amount) returns (bool)",
      "event Transfer(address indexed from, address indexed to, uint256 value)"
    ]
    //const contract = new ethers.Contract(address, abi, provider);
    //console.log("name and symbol:", await contract.name(), await contract.symbol());
    //console.log("balanceOf:", ethers.utils.formatEther(await contract.balanceOf(addressOwner)));

    //for transfer
    const signer = provider.getSigner(addressOwner);
    const contract = new ethers.Contract(address, abi, signer);
    await contract.transfer(addressTo, ethers.utils.parseEther("10"));
    console.log("balaceOf:", ethers.utils.formatEther(await contract.balanceOf(addressTo)));

    //queryFilter 可以根据区块或hash查询日志
    const events = await contract.queryFilter("Transfer");
    //console.log("events :", events);

    //Subscribe on
    contract.on("Transfer", (from, to, amount, event) => {
      console.log(`from: ${from} | to: ${to} | amount: ${amount}`)
    });
    //await sleep(1000);//显示在终端上，实际中不需要。

    //listenerCount
    console.log("listenerCount", contract.listenerCount());

    function sleep(ms) {
      return new Promise((resolve) => {
        setTimeout(resolve,ms);
      });
    }

  });
});
