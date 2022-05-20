const { expect } = require("chai");
const { ethers } = require("hardhat");
//学习signer

describe("Ethers", function () {
 it("For signer ", async function () {
   const provider1 = new ethers.providers.JsonRpcProvider();
   const signer1 = provider1.getSigner();
   console.log("signer1 getChainId", await signer1.getChainId());
   //for address
   console.log("signer1 address", await signer1.getAddress());
   console.log("signer1 isSigner", signer1._isSigner);
   //for gas price
   const gasprice = await signer1.getGasPrice();
   console.log("signer1 gasprice", ethers.utils.formatEther(gasprice));
   //for signatrue
   const msg = "Hello World";
   const signatrue = await signer1.signMessage(msg);
   console.log("Signatrue", signatrue);
   //for sendTransaction
   const amount = "1";
   const amount1 = ethers.utils.parseEther(amount);
   const transactionRequest {
     to:"0xed25f9dc2D684868420aAe58ca82529f14d279fd",
     from:"0xa6Ff359a5E29d8C23B82E711b5d609FaEDC70756",
     value:"amount1"
   };
   const response = await signer1.sendTransaction(transactionRequest);
   console.log("response", response);
   const toBalance = await provider1.getBalance("0xed25f9dc2D684868420aAe58ca82529f14d279fd");
   console.log("to balace", ethers.utils.formatEther(toBalance));
 });
});
