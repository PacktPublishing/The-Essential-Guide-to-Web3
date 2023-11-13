// scripts/interact.js
const { ethers } = require("hardhat");

async function main() {
    console.log('Getting the My Simple Token Contract...\n');
    const contractAddress = '0x2b42e102357abe45e6e7F7eEd735a2F235E9345B';
    const mySimpleToken = await ethers.getContractAt('MySimpleToken',contractAddress);

    // List of all ERC20 public functions that can be called via Hardhat
    console.log(`-------------------------------------------------------`);
    console.log(`List of all ERC20 public functions called via Hardhat`);
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
    console.log(`An account transfer from one account to another`);
    console.log(`-------------------------------------------------------`);
    
    console.log('Initiating a transfer...');
    //const recipientAddress = signers[1].address;

    const recipientAddress = 'CONTRACT-ADDRESS';//REPLACE WITH CONTRACT ADDRESS
    const transferAmount = 100000;
    console.log(`Transferring ${transferAmount} ${symbol} tokens to ${recipientAddress} from ${ownerAddress}`);
    await mySimpleToken.transfer(recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), decimals));
    console.log('Transfer completed');
    ownerBalance = await mySimpleToken.balanceOf(ownerAddress);
    console.log(`Balance of owner (${ownerAddress}): ${ethers.utils.formatUnits(ownerBalance, decimals)} ${symbol}`);
    let recipientBalance = await mySimpleToken.balanceOf(recipientAddress);
    console.log(`Balance of recipient (${recipientAddress}): ${ethers.utils.formatUnits(recipientBalance, decimals)} ${symbol}\n`);

    console.log(`-------------------------------------------------------`);
    console.log(`Set spending limits for accounts with 10000 tokens`);
    console.log(`-------------------------------------------------------`);

    //Comment the following lines for testing in Sepolia
    console.log(`Setting allowance amount of spender over the caller\'s ${symbol} tokens...`);
    const approveAmount = 10000;
    console.log(`This example allows the contractOwner to spend up to ${approveAmount} of the recipient\'s ${symbol} token`);
    const signerContract = mySimpleToken.connect(signers[1]); // Creates a new instance of the contract connected to the recipient
    await signerContract.approve(ownerAddress, ethers.utils.parseUnits(approveAmount.toString(), decimals));
    console.log(`Spending approved\n`);

    console.log(`-------------------------------------------------------`);
    console.log(`An  transfer from one account to another`);
    console.log(`-------------------------------------------------------`);
    console.log(`Getting the smart contract owner spending allowance over recipient\'s ${symbol} tokens...`);
    let allowance = await mySimpleToken.allowance(recipientAddress, ownerAddress);
    console.log(`contractOwner Allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);


    console.log(`-------------------------------------------------------`);
    console.log(`Transfer 100 Tokens from one account to another`);
    console.log(`-------------------------------------------------------`);
    const transferFromAmount = 100;
    console.log(`contracOwner transfers ${transferFromAmount} ${symbol} from recipient\'s account into own account...`);
    await mySimpleToken.transferFrom(recipientAddress, ownerAddress, ethers.utils.parseUnits(transferFromAmount.toString(), decimals));
    ownerBalance = await mySimpleToken.balanceOf(ownerAddress);
    console.log(`New owner balance (${ownerAddress}): ${ethers.utils.formatUnits(ownerBalance, decimals)} ${symbol}`);
    recipientBalance = await mySimpleToken.balanceOf(recipientAddress);
    console.log(`New recipient balance (${recipientAddress}): ${ethers.utils.formatUnits(recipientBalance, decimals)} ${symbol}`);
    allowance = await mySimpleToken.allowance(recipientAddress, ownerAddress);
    console.log(`Remaining allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);


    console.log(`-------------------------------------------------------`);
    console.log(`Increasing the spending allowance by 100 Tokens`);
    console.log(`-------------------------------------------------------`);
    const incrementAmount = 100;
    console.log(`Incrementing contractOwner allowance by ${incrementAmount} ${symbol}...`);
    await signerContract.increaseAllowance(ownerAddress, ethers.utils.parseUnits(incrementAmount.toString(), decimals));
    allowance = await mySimpleToken.allowance(recipientAddress, ownerAddress);
    console.log(`Updated allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);

    console.log(`-------------------------------------------------------`);
    console.log(`Decreasing the spending allowance 100 Tokens`);
    console.log(`-------------------------------------------------------`);
    const subtractAmount = 100;
    console.log(`Subtracting contractOwner allowance by ${subtractAmount} ${symbol}...`);
    await signerContract.decreaseAllowance(ownerAddress, ethers.utils.parseUnits(subtractAmount.toString(), decimals));
    allowance = await mySimpleToken.allowance(recipientAddress, ownerAddress);
    console.log(`Updated allowance: ${ethers.utils.formatUnits(allowance, decimals)} ${symbol}\n`);    

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