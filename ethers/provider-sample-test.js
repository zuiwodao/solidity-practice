const { expect } = require("chai");
const { ethers } = require("hardhat");
//学习JsonRpcProvider

describe("Ethers", function () {
 it("For localhost JsonRpcProvider ", async function () {
   const provider = new ethers.providers.JsonRpcProvider("http://localhost:9545");
   const connection = provider.connection;
   console.log("connention",connection);

   const signer = await provider.getSigner("0x205Eb129645aaE477Abd369339deB6e1E7938BC2");
   const signerAddress = await signer.getAddress();
   console.log("signerAddress", signerAddress);

   const accounts = await provider.listAccounts();
   console.log("Accounts", accounts);

   const arrayAccounts = ["0x4Ae6198FE3F71Fd5D8D42B798A638f3F76Ff299F"];
   const accountsBalance = await provider.send("eth_getBalance",arrayAccounts);
   console.log("accountsBalance",ethers.utils.formatEther(accountsBalance));
 });
});
