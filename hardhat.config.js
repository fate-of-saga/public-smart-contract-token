require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-web3");
const fs = require('fs')
const privateKey = fs.readFileSync(".secrets").toString().trim() || "01234567890123456789"
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
  networks: {
    bscTestnet: {
      chainId: 97,
      url: "https://data-seed-prebsc-1-s1.binance.org:8545",
      accounts: [privateKey]
    },
    bsc: {
      chainId: 56,
      url: "https://bsc-dataseed1.binance.org",
      accounts: [privateKey]
    },
    Matic: {
      chainId: 137,
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [privateKey]
    }
  },
  etherscan: {
    apiKey: "31VIEZSUSCUQMW7T2NHBXEZWIUGJDYH43P"
  },
  solidity: {
    version: "0.8.10",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
};