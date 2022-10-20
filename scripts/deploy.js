const hre = require("hardhat");

async function main() {
  const Calculator = await hre.ethers.getContractFactory("Calculator");
  const calculator = await Calculator.deploy();

  await calculator.deployed();

  console.log("Calculator deployed to:", calculator.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
