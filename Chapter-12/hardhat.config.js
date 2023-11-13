require("@nomicfoundation/hardhat-toolbox");

const API_KEY = "INFURA-SEPOLIA-API_KEY";
const PRIVATE_KEY = "METAMASK PRIVATE KEY"

module.exports = {
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {
    },
    sepolia: {
      url: API_KEY,
      accounts: [PRIVATE_KEY],
    }
  },
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 40000
  }
}