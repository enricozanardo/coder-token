var coderToken = artifacts.require("./CoderToken.sol");

module.exports = function(deployer) {
  deployer.deploy(coderToken);
};