// scripts/interact.js
const { ethers } = require("hardhat");

async function main() {
    console.log('Getting the My Simple Token Contract...\n');
    const contractAddress = 'CONTRACT-ADDRESS';//REPLACE WITH CONTRACT ADDRESS
    const mySimpleToken = await ethers.getContractAt('MySimpleToken',contractAddress);

    // List of all ERC20 public functions that can be called via Hardhat
    console.log(`-------------------------------------------------------`);
    console.log(`List of all ERC20 public functions called via Hardhat from Sepolia`);
    console.log(`-------------------------------------------------------`);
    const name = await mySimpleToken.name();
    console.log(`The smart contract created the Token with Name: ${name}`);

    const symbol = await mySimpleToken.symbol();
    console.log(`The smart contract created the Token with Symbol: ${symbol}`);

    const decimals = await mySimpleToken.decimals();
    console.log(`The smart contract created the Token with Decimals: ${decimals}`);

    const totalSupply = await mySimpleToken.totalSupply();
    console.log(`Smart Contract has a total supply of the ${symbol}: ${ethers.utils.formatUnits(totalSupply, decimals)}`);

    const signers = await ethers.getSigners();
    const ownerAddress = signers[0].address;
    let ownerBalance = await mySimpleToken.balanceOf(ownerAddress);
    console.log(`Smart contract owner at ${ownerAddress} has a ${symbol} balance of ${ethers.utils.formatUnits(ownerBalance, decimals)}\n`);

   
    console.log(`-------------------------------------------------------`);
    console.log(`All Done !`);
    console.log(`-------------------------------------------------------`);

}
  
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exitCode = 1;
    });