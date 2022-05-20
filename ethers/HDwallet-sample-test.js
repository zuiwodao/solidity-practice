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
    console.log(`walletRondom mnemonic:${JSON.stringify(walletRondom.mnemonic)} | address: ${walletRondom.address}`);
    console.log("mnemonic:",walletRondom.mnemonic);

    //hollow candy census soap slogan tobacco crack safe change veteran attend leisure
    //0xF36007fD9b9d58F83FFBa336A68Ec31e4d035b5C
    const mnemonic = "hollow candy census soap slogan tobacco crack safe change veteran attend leisure";
    const hdNode = ethers.utils.HDNode.fromMnemonic(mnemonic);
    console.log(`hdNode private key:${hdNode.privateKey} | address:${hdNode.address}`);
    console.log(`hdNode mnemonic:${JSON.stringify(hdNode.mnemonic)}`);
    console.log(`hdNode path:${hdNode.path}`);

    /*
      CKD: m: 使用 CKDpriv, M 则表示使用 CKDPub
      Purpose: 44' , hardened, 遵循哪个规范, 44 意味着 BIP44
      Coin: 60', hardened, 60 指代以太坊, 完整的链代码
      Account: 0' , hardened, 账户编号
      Chain: 0 , 对于非比特币路径都是 0
      Index: 0, 具体的账户节点
    */ 
    basepathstr = "m/44'/60'/0'/0/1/"
    for(i=0;i<10;i++){
      const iHDNode = hdNode.derivePath(basepathstr+i.toString());
      console.log(`iHDNode address:${iHDNode.address} | path:${iHDNode.path}`);
    }

    //iHDNode address:0x64FE0234158566af18FfbAb3EE4992f9CE19aB52 | path:m/44'/60'/0'/0/1/8
    const wallet = ethers.Wallet.fromMnemonic(mnemonic,"m/44'/60'/0'/0/1/8");
    console.log(`wallet address:${wallet.address}`);

    //mnemonicToSeed
    const seed = ethers.utils.mnemonicToSeed(mnemonic);
    console.log(`mnemonicToSeed:${seed}`);

    //mnemonicToEntropy
    const entropy = ethers.utils.mnemonicToEntropy(mnemonic);
    console.log(`mnemonicToEntropy:${entropy}`);
  });
});