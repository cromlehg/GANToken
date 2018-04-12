import ether from './helpers/ether';
import tokens from './helpers/tokens';
import {advanceBlock} from './helpers/advanceToBlock';
import {increaseTimeTo, duration} from './helpers/increaseTime';
import latestTime from './helpers/latestTime';
import EVMRevert from './helpers/EVMRevert';

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

const Configurator = artifacts.require('Configurator.sol');
const Token = artifacts.require('GANToken.sol');
const PreICO = artifacts.require('PreICO.sol');
const ICO = artifacts.require('ICO.sol');
const FreezeTokensWallet = artifacts.require('FreezeTokensWallet.sol');

contract('Configurator integration test', function (accounts) {
  let configurator;
  let token;
  let preico;
  let ico;
  let teamwallet;
  let gaffwallet;

  const manager = '0xAa2e8e600c3874BD26a86c9A5873a24b855Be1EC';

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
    configurator = await Configurator.new();
    await configurator.deploy();

    const tokenAddress = await configurator.token();
    const preicoAddress = await configurator.preICO();
    const icoAddress = await configurator.ico();
    const teamwalletAddress = await configurator.teamTokensWallet();
    const gaffalletAddress = await configurator.gaffTokensWallet();

    token = await Token.at(tokenAddress);
    preico = await PreICO.at(preicoAddress);
    ico = await ICO.at(icoAddress);
    teamwallet = await ICO.at(teamwalletAddress);
    gaffwallet = await ICO.at(gaffalletAddress);
  });

  it('contracts should have token address', async function () {
    const tokenOwner = await token.owner();
    tokenOwner.should.bignumber.equal(manager);
  });

  it('contracts should have preICO address', async function () {
    const preicoOwner = await preico.owner();
    preicoOwner.should.bignumber.equal(manager);
  });

  it('contracts should have ICO address', async function () {
    const icoOwner = await ico.owner();
    icoOwner.should.bignumber.equal(manager);
  });

  it('ICO should have team wallet address', async function () {
    const teamwalletOwner = await teamwallet.owner();
    teamwalletOwner.should.bignumber.equal(ico.address);
    const walletAddress = await ico.teamTokensWallet();
    teamwallet.address.should.bignumber.equal(walletAddress);
  });

  it('ICO should have gaff wallet address', async function () {
    const gaffwalletOwner = await gaffwallet.owner();
    gaffwalletOwner.should.bignumber.equal(ico.address);
    const walletAddress = await ico.gaffTokensWallet();
    gaffwallet.address.should.bignumber.equal(walletAddress);
  });

  it('preICO and ICO should have start time as described in README', async function () {
    const preicoStart = await preico.start();
    preicoStart.should.bignumber.equal((new Date('12 Feb 2018 00:00:00 GMT')).getTime() / 1000);
    const icoStart = await ico.start();
    icoStart.should.bignumber.equal((new Date('10 Mar 2018 00:00:00 GMT')).getTime() / 1000);
  });

  it ('preICO and ICO should have price as described in README', async function () {
    const preicoPrice = await preico.price();
    preicoPrice.should.bignumber.equal(tokens(8600));
    const icoPrice = await ico.price();
    icoPrice.should.bignumber.equal(tokens(8600));
  });

  it ('preICO should have softcap as described in README', async function () {
    const preicoSoftcap = await preico.softcap();
    preicoSoftcap.should.bignumber.equal(ether(3500));
  });

  it ('preICO and ICO should have hardcap as described in README', async function () {
    const preicoHardcap = await preico.hardcap();
    preicoHardcap.should.bignumber.equal(ether(17500));
    const icoHardcap = await ico.hardcap();
    icoHardcap.should.bignumber.equal(ether(40500));
  });

  it ('preICO and ICO should have minimal insvested limit as described in README', async function () {
    const preicoMinInvest = await ico.minInvestedLimit();
    preicoMinInvest.should.bignumber.equal(ether(0.1));
    const icoMinInvest = await ico.minInvestedLimit();
    icoMinInvest.should.bignumber.equal(ether(0.1));
  });

  it ('bounty, advisors, service, team percent should be as described in README', async function () {
    const bountyPercent = await ico.bountyTokensPercent();
    bountyPercent.should.bignumber.equal(2);
    const advisorsPercent = await ico.advisorsTokensPercent();
    advisorsPercent.should.bignumber.equal(6);
    const servicePercent = await ico.serviceTokensPercent();
    servicePercent.should.bignumber.equal(2);
    const teamPercent = await ico.teamTokensPercent();
    teamPercent.should.bignumber.equal(5);
  });

  it ('preICO and ICO should have wallets as described in README', async function () {
    const preicoWallet = await preico.wallet();
    preicoWallet.should.bignumber.equal('0x1AA6F6c5bd4f56e2f57a5F8c0ECC549E9A8a944D');
    const icoWallet = await ico.wallet();
    icoWallet.should.bignumber.equal('0x4fcE3E532Aadd2119fd9012971D9E161aB27896E');
  });

  it ('bounty wallet, advisors wallet, service wallet should be as described in README', async function () {
    const bountyWallet = await ico.bountyTokensWallet();
    bountyWallet.should.bignumber.equal('0x0CAb6DA6020489DD510bA88A891b7D08c905254A');
    const advisorsWallet = await ico.advisorsTokensWallet();
    advisorsWallet.should.bignumber.equal('0x8B7a83c35CAdedC04BA73b874705661DC2039335');
    const serviceWallet = await ico.serviceTokensWallet();
    serviceWallet.should.bignumber.equal('0x0b06DE4D5BB9D06B702fED24C763E976B7d3c36f');
  });

});
