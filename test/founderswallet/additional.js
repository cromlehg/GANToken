import ether from '../helpers/ether';
import tokens from '../helpers/tokens';
import {advanceBlock} from '../helpers/advanceToBlock';
import {duration, increaseTimeTo} from '../helpers/increaseTime';
import latestTime from '../helpers/latestTime';
import EVMRevert from '../helpers/EVMRevert';

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

export default function (Token, FoundersWallet, wallets) {
  let token;
  let foundersWallet;

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
  });

  beforeEach(async function () {
    this.Period = 360;

    token = await Token.new();
    foundersWallet = await FoundersWallet.new();

    await foundersWallet.setPeriod(this.Period);
    await foundersWallet.setToken(token.address);
    await foundersWallet.transferOwnership(wallets[1]);
    await token.transferOwnership(wallets[1]);
  });

  it('should not retrieve tokens before unlock date', async function () {
    await token.mint(foundersWallet.address, 100, {from: wallets[1]});
    await token.finishMinting({from: wallets[1]});
    await foundersWallet.start({from: wallets[1]});
    const unlock = await foundersWallet.unlockDate();
    await increaseTimeTo(unlock - duration.seconds(100));
    await foundersWallet.retrieveTokens(wallets[2], {from: wallets[1]}).should.be.rejectedWith(EVMRevert);
  });

  it('should retrieve tokens after lock period', async function () {
    await token.mint(foundersWallet.address, 100, {from: wallets[1]});
    await token.finishMinting({from: wallets[1]});
    await foundersWallet.start({from: wallets[1]});
    const unlock = await foundersWallet.unlockDate();
    await increaseTimeTo(unlock + duration.seconds(100));
    await foundersWallet.retrieveTokens(wallets[2], {from: wallets[1]});
    const balance = await token.balanceOf(wallets[2]);
    assert.equal(balance, 100);
  });
}
