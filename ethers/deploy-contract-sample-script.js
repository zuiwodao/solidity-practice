const hre = require("hardhat");

async function main() {
//获取ContractFactory,读取artifacts/contracts/Greeterjson
 // const Greeter = await hre.ethers.getContractFactory("Greeter");
 //指定账号部署
  const signers = await hre.ethers.getSigners();
  const Greeter = await hre.ethers.getContractFactory("Greeter",signers[2]);
  console.log("signers three", signers[2].address);

  //获取Artifacts
  const artifact = await hre.artifacts.readArtifact("Greeter");
  console.log("artifact:",artifact);

  //获取Interface
  const interface = Greeter.interface;
  console.log("interface:", interface);

  //获取Bytecode
  const bytecode = Greeter.bytecode;
  console.log("Bytecode:", bytecode);

  //attach使用,通过合约地址（以前部署过合约），获取合约。要知道合约名字。
  const contract = Greeter.attach("0x6e989C01a3e3A94C973A62280a72EC335598490e");
  console.log("contract greeter", await contract.greet());

  //部署合约
  const greeter = await Greeter.deploy("Hello, Hardhat...");
  console.log("deployTransaction",greeter.deployTransaction);
  console.log("deployTransaction.wait",await greeter.deployTransaction.wait());
  console.log("Greeter:", await greeter.greet());

 // const greeter = await Greeter.deploy("Hello, Hardhat!");
 // await greeter.deployed();
 // console.log("Greeter deployed to:", greeter.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
