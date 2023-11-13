const { expect } = require('chai');
const { ethers } = require("hardhat");

// Start test block
describe('MySimpleToken', function () {
  before(async function () {
    this.MySimpleToken = await ethers.getContractFactory('MySimpleToken');
  });

  beforeEach(async function () {
    this.mySimpleToken = await this.MySimpleToken.deploy();
    await this.mySimpleToken.deployed();

    this.decimals = await this.mySimpleToken.decimals();

    const signers = await ethers.getSigners();

    this.ownerAddress = signers[0].address;
    this.recipientAddress = signers[1].address;

    this.signerContract = this.mySimpleToken.connect(signers[1]);
  });

  // Test cases
  it('Test case 1 to create a token with a name', async function () {
    expect(await this.mySimpleToken.name()).to.exist;
    // expect(await this.mySimpleToken.name()).to.equal('MySimpleToken');
  });

  it('Test case 2 to create a token with a symbol', async function () {
    expect(await this.mySimpleToken.symbol()).to.exist;
    // expect(await this.mySimpleToken.symbol()).to.equal('FUN');
  });

  it('Test case 3 to check that Token a valid decimal', async function () {
    expect((await this.mySimpleToken.decimals()).toString()).to.equal('18');
  })

  it('Test case 4 to check whether Token has a valid total supply', async function () {
    const expectedSupply = ethers.utils.parseUnits('1000000', this.decimals);
    expect((await this.mySimpleToken.totalSupply()).toString()).to.equal(expectedSupply);
  });

  it('Test case 5 to check if able to query account balances', async function () {
    const ownerBalance = await this.mySimpleToken.balanceOf(this.ownerAddress);
    expect(await this.mySimpleToken.balanceOf(this.ownerAddress)).to.equal(ownerBalance);
  });

  it('Test case 6 to transfers the right amount of tokens to/from an account', async function () {
    const transferAmount = 1000;
    await expect(this.mySimpleToken.transfer(this.recipientAddress, transferAmount)).to.changeTokenBalances(
        this.mySimpleToken,
        [this.ownerAddress, this.recipientAddress],
        [-transferAmount, transferAmount]
      );
  });

  it('Test case 7 to see if the smart contact emits a transfer event with the right arguments', async function () {
    const transferAmount = 100000;
    await expect(this.mySimpleToken.transfer(this.recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals)))
        .to.emit(this.mySimpleToken, "Transfer")
        .withArgs(this.ownerAddress, this.recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
  });

  it('Test case 8 to allow for allowance approvals and queries', async function () {
    const approveAmount = 10000;
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(approveAmount.toString(), this.decimals));
    expect((await this.mySimpleToken.allowance(this.recipientAddress, this.ownerAddress))).to.equal(ethers.utils.parseUnits(approveAmount.toString(), this.decimals));
  });

  it('Test case 9 to emits an approval event with the right arguments', async function () {
    const approveAmount = 10000;
    await expect(this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(approveAmount.toString(), this.decimals)))
        .to.emit(this.mySimpleToken, "Approval")
        .withArgs(this.recipientAddress, this.ownerAddress, ethers.utils.parseUnits(approveAmount.toString(), this.decimals))
  }); 

  it('Test case 10 to allows an approved spender to transfer from owner', async function () {
    const transferAmount = 10000;
    await this.mySimpleToken.transfer(this.recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
    await expect(this.mySimpleToken.transferFrom(this.recipientAddress, this.ownerAddress, transferAmount)).to.changeTokenBalances(
        this.mySimpleToken,
        [this.ownerAddress, this.recipientAddress],
        [transferAmount, -transferAmount]
      );
  });

  it('Test case 11 to emit a transfer event with the right arguments when conducting an approved transfer', async function () {
    const transferAmount = 10000;
    await this.mySimpleToken.transfer(this.recipientAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
    await expect(this.mySimpleToken.transferFrom(this.recipientAddress, this.ownerAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals)))
        .to.emit(this.mySimpleToken, "Transfer")
        .withArgs(this.recipientAddress, this.ownerAddress, ethers.utils.parseUnits(transferAmount.toString(), this.decimals))
  });

  it('Test case 12 to allow allowance to be increased and queried', async function () {
    const initialAmount = 100;
    const incrementAmount = 10000;
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(initialAmount.toString(), this.decimals))
    const previousAllowance = await this.mySimpleToken.allowance(this.recipientAddress, this.ownerAddress);
    await this.signerContract.increaseAllowance(this.ownerAddress, ethers.utils.parseUnits(incrementAmount.toString(), this.decimals));
    const expectedAllowance = ethers.BigNumber.from(previousAllowance).add(ethers.BigNumber.from(ethers.utils.parseUnits(incrementAmount.toString(), this.decimals)))
    expect((await this.mySimpleToken.allowance(this.recipientAddress, this.ownerAddress))).to.equal(expectedAllowance);
  });

  it('Test case 13 to emits approval event when alllowance is increased', async function () {
    const incrementAmount = 10000;
    await expect(this.signerContract.increaseAllowance(this.ownerAddress, ethers.utils.parseUnits(incrementAmount.toString(), this.decimals)))
        .to.emit(this.mySimpleToken, "Approval")
        .withArgs(this.recipientAddress, this.ownerAddress, ethers.utils.parseUnits(incrementAmount.toString(), this.decimals))
  });

  it('Test case 14 to allow allowance to be decreased and queried', async function () {
    const initialAmount = 100;
    const decrementAmount = 10;
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(initialAmount.toString(), this.decimals))
    const previousAllowance = await this.mySimpleToken.allowance(this.recipientAddress, this.ownerAddress);
    await this.signerContract.decreaseAllowance(this.ownerAddress, ethers.utils.parseUnits(decrementAmount.toString(), this.decimals));
    const expectedAllowance = ethers.BigNumber.from(previousAllowance).sub(ethers.BigNumber.from(ethers.utils.parseUnits(decrementAmount.toString(), this.decimals)))
    expect((await this.mySimpleToken.allowance(this.recipientAddress, this.ownerAddress))).to.equal(expectedAllowance);
  });

  it('Test case 15 to emits approval event when allowance is decreased', async function () {
    const initialAmount = 100;
    const decrementAmount = 10;
    await this.signerContract.approve(this.ownerAddress, ethers.utils.parseUnits(initialAmount.toString(), this.decimals))
    const expectedAllowance = ethers.BigNumber.from(ethers.utils.parseUnits(initialAmount.toString(), this.decimals)).sub(ethers.BigNumber.from(ethers.utils.parseUnits(decrementAmount.toString(), this.decimals)))
    await expect(this.signerContract.decreaseAllowance(this.ownerAddress, ethers.utils.parseUnits(decrementAmount.toString(), this.decimals)))
        .to.emit(this.mySimpleToken, "Approval")
        .withArgs(this.recipientAddress, this.ownerAddress, expectedAllowance)
  });

});