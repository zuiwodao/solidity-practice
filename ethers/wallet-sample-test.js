const { expect } = require("chai");
const { ethers } = require("hardhat");
//学习wallet

describe("Ethers", function () {
  it("For wallet", async function () {
    //for create by key
    const privateKey = "0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";
    const walletKey = new ethers.Wallet(privateKey);
    console.log("walletByKey", walletKey.address);

    //for create by random private key
    const walletRondom = new ethers.Wallet.createRandom();
    console.log("walletRomdom address", walletRondom.address);
    console.log("walletRondom private Key", walletRondom.privateKey);
    console.log("walletRondom public key", walletRondom.publicKey);

   // const mnemonic = walletRondom.mnemonic;
    console.log("walletRondom", walletRondom.mnemonic);

    const walletMnemonic = new ethers.Wallet.fromMnemonic(walletRondom.mnemonic.phrase);
    console.log("walletMnemonic address", walletMnemonic.address);
    
    //encrypt
    const jsonWallet = await walletMnemonic.encrypt("foo");
    console.log("jsonWallet", jsonWallet);

    const password = "foo";
    const walletFromEncryptedJson = await new ethers.Wallet.fromEncryptedJson(jsonWallet, password);
    console.log("walletFromEncryptedJons address", walletFromEncryptedJson.address);
    
    //for wallet signing a message
    const msg = "Hello World";
    const walletSignature = await walletMnemonic.signMessage(msg);
    console.log("\nwalletSignature", walletSignature);
    
    //for signer signing a message
    const provider1 = new ethers.providers.JsonRpcProvider();
    const signer1 = provider1.getSigner();
    const signerSignature = await signer1.signMessage(msg);
    console.log("signer signature", signerSignature);

    //for signTransaction
    const amount = "100";
    const amount1 = ethers.utils.parseEther(amount);
    const transactionRequest = {to:"0x70997970c51812dc3a010c7d01b50e0d17dc79c8",value:amount1};
    const signReponse = await walletKey.signTransaction(transactionRequest);
    console.log("signTransaction response", signReponse);

    //for sendTransaction
    const tx = {to:"0x70997970c51812dc3a010c7d01b50e0d17dc79c8",value:amount1};
    const sendTransactionWallet = walletKey.connect(provider1);
    const response = await sendTransactionWallet.sendTransaction(tx);
    //for balance
    const balance = await provider1.getBalance("0x70997970c51812dc3a010c7d01b50e0d17dc79c8");
    console.log("for balance", ethers.utils.formatEther(balance));

  });
});