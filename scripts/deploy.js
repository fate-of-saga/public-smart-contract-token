const {ethers} = require("hardhat");
async function main () {

    const FunctionFactory = await ethers.getContractFactory("FateOfSaga");
    const FunctionInstance = await FunctionFactory.deploy();
    await FunctionInstance.deployed();
    console.log("This Contract deployed to:", FunctionInstance.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });