import additional from './founderswallet/additional';
import ownable from './founderswallet/ownable';

const token = artifacts.require('GANToken.sol');
const foundersWallet = artifacts.require('FreezeTokensWallet.sol');

contract('Freeze Tokens Wallet is ownable', function (accounts) {
  ownable(foundersWallet, accounts);
});

contract('Freeze Tokens Wallet - test for additional functional', function (accounts) {
  additional(token, foundersWallet, accounts);
});
