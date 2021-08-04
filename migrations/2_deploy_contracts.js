var EtherPage = artifacts.require ("EtherPage.sol");

module.exports = function(deployer) {
    // console.log(HelloWorld)
    deployer.deploy(EtherPage);
}