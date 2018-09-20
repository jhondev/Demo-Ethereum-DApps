var SimpleCoin = artifacts.require('./SimpleCoin2.sol');

module.exports = function (deployer) {
    deployer.deploy(SimpleCoin, 10000);
}