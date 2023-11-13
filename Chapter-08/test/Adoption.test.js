const {time, loadFixture,} = require("@nomicfoundation/hardhat-toolbox/network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Adoption", function () {

  async function deployAdoptionFixture() {
    
    // Contracts are deployed using the first signer/account by default
    const [owner, testUser] = await ethers.getSigners();
    const Adoption = await ethers.getContractFactory("Adoption");
    const adoption = await Adoption.deploy();

    // Adopt a Pet Test
    testPetId = 1;
    await adoption.connect(testUser).adopt(testPetId);

    return { adoption, testUser, testPetId };
  }

  describe("Adopting a pet and retrieving account addresses", function () {
    
    it("can fetch the address of an owner by pet id", async function () {
      const { adoption, testUser, testPetId  } = await loadFixture(deployAdoptionFixture);
      const adopter = await adoption.adopters(testPetId);
      expect(adopter).to.equal(testUser.address);
    });

    it("can fetch the collection of all pet owners' addresses", async function () {
      const { adoption, testUser, testPetId  } = await loadFixture(deployAdoptionFixture);
      const adopters = await adoption.getAdopters();
      expect(adopters[testPetId]).to.equal(testUser.address);
    });
  });

 });
