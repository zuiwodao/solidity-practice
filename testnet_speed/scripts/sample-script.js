
const hre = require("hardhat");
//测试多网络速度
async function main() {

  let start = new Date().getTime();
  const MyToken = await hre.ethers.getContractFactory("MyToken");
  const myToken = await MyToken.deploy();

  await myToken.deployed();

  console.log("Mytoken deployed to:", myToken.address);
  console.log("MyToken name",myToken.name());
  let end = new Date().getTime();
  let diff = end - start;
  console.log("Took times:", diff);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
