// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

    // Get the contract owner
    const contractOwner = await hre.ethers.getSigners();
    console.log(`Deploying contract from: ${contractOwner[0].address}`);
  
    // Hardhat helper to get the ethers contractFactory object
    const myPetNFTContract = await hre.ethers.getContractFactory('MyPetNFT');
  
    // Deploy the contract
    console.log('Deploying MyPetNFT Contract...');
    const myPetNFTToken = await myPetNFTContract.deploy();
    await myPetNFTToken.waitForDeployment();

    console.log(`MyPetNFT Contract deployed to Sepolia TestNet and the contract address is : ${await myPetNFTToken.getAddress()} \n`);
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
