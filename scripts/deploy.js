const {ethers} = require("hardhat");
async function main () {

    const ContractFactory = await ethers.getContractFactory("FateOfSagaToken");
    const ContractInstance = await ContractFactory.deploy();
    await ContractInstance.deployed();
    console.log("This Contract deployed to:", ContractInstance.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });