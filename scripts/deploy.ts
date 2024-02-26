import { ethers } from "hardhat";

async function main() {


  const blogFactory = await ethers.deployContract("BlogFactory");

  await blogFactory.waitForDeployment();

  console.log(
    `Blog factory deployed to ${blogFactory.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
