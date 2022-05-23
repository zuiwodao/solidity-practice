const { expect } = require("chai");
const { ethers,Contract } = require("hardhat");
//学习contract

describe("Ethers", function () {
  it("For contract", async function () {
    
    //创建前端合约
    const address = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
    const greeterContract = await ethers.getContractAt("Greeter", address);
    const setGreeterTx = await greeterContract.setGreeting("hello world");
    await setGreeterTx.wait();
    console.log("Address:",greeterContract.address,"Greeter:",await greeterContract.greet());

    /*//attach使用
    const addressAttach = "0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9";
    const greeterContract2 = greeterContract.attach(addressAttach);
    const setGreetingTx2 = await greeterContract2.setGreeting("thinkingchain");
    await setGreetingTx2.wait();
    console.log("Address:",greeterContract2.address,"Greeter:",await greeterContract2.greet());
*/
    //provider
    const provider = greeterContract.provider;
    console.log("provider", provider.connection);
    
    //signer
    console.log("signer",greeterContract.signer.address);

    //eventFilter
    let eventFilter = greeterContract.filters.Event1();
    const queryFilter = await greeterContract.queryFilter(eventFilter);
    console.log("queryFilter", queryFilter);

    //listerner
    greeterContract.on('Event1', (str) => {
      console.log('#Event1',str);
    });

    //listenerCount
    console.log("listenerCount", greeterContract.listenerCount());

    //contract.functions.METHOD_NAME
    const resultForRead = await greeterContract.functions.greet();
    console.log("result", resultForRead);
    

    //contract.METHOD_NAME  没有测试成功
    //const resultForWrite = await greeterContract.setGreeting("test");
    //console.log("result", resultForWrite);

    //estimateGas
    //const resultForEstimateGas = await greeterContract.estimateGas.setGreeting("test");
    //console.log("resultForEstimateGas", ethers.utils.formatEther(resultForEstimateGas));

    //populateTransaction
    const resultPopulateTransaction = await greeterContract.populateTransaction.setGreeting("test");
    console.log("resultPopulateTransaction", resultPopulateTransaction);
  
  });
});
