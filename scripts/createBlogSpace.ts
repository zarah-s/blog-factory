import { ethers } from "hardhat";

async function main() {

    const BLOG_FACTORY_CONTRACT_ADDRESS = "0x5979fa9AdEaE7289766Cf3E4420932DBAB2ea1D4"


    const BlogFactory = await ethers.getContractFactory("BlogFactory");

    const blogFactory = BlogFactory.attach(BLOG_FACTORY_CONTRACT_ADDRESS);


    const tx = await (blogFactory as any).createNewBlogSpace("Zero Knowledge Proofs", "Strictly on ZKP");

    await tx.wait()


    console.log(tx);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
