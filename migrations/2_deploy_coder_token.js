var coderToken = artifacts.require("./Coder-token.sol");

module.exports = function(deployer) {
  deployer.deploy(coderToken);
};