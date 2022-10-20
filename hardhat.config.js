require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.7.3",
  networks: {
    "optimism-goerli": {
       url: `https://opt-goerli.g.alchemy.com/v2/${process.env.OPTIMISM_GOERLI_ALCHEMY_KEY}`,
       accounts: [process.env.WALLET_PRIVATE_KEY]
     },
     "goerli": {
       url: `https://eth-goerli.g.alchemy.com/v2/${process.env.GOERLI_ALCHEMY_KEY}`,
       accounts: [process.env.WALLET_PRIVATE_KEY]
     }
 } 
};
