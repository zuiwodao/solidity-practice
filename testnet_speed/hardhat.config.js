require("@nomiclabs/hardhat-waffle");
require("dotenv").config();//配置env配置
module.exports = {
  solidity: "0.8.4",

  networks: {
    arbitrum1: {
      url:process.env.RINKEBY_ARBITRUM1,
      accounts: [process.env.PRIVATEKEY]
    },
    arbitrum2:{
      url: process.env.RINKEBY_ARBITRUM2,
      accounts: [process.env.PRIVATEKEY]
    },
    rinkeby: {
      url: process.env.RINKEBY_ALCHEMY,
      accounts: [process.env.PRIVATEKEY]
    },
    ropsten: {
      url: process.env.ROPSTEN_INFURA,
      accounts: [process.env.PRIVATEKEY]

      }
    }
};
