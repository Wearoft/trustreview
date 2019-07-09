const Migrations = artifacts.require("Migrations");
const TrustReviewToken = artifacts.require("TrustReviewToken");

module.exports = function(deployer, network, accounts) {
  deployer.deploy(Migrations);
  deployer.deploy(TrustReviewToken, accounts[0], "TrustReviewToken", "TRT", 1000000000000);
  //deployer.deploy(TrustReviewToken);

};
