import additional from './token/additional';
import basic from './token/basic';
import mintable from './token/mintable';
import ownable from './token/ownable';
import standard from './token/standard';

const token = artifacts.require('GANToken.sol');

contract('GANToken - BasicToken test', function (accounts) {
  basic(token, accounts);
});
contract('GANToken - StandardToken test', function (accounts) {
  standard(token, accounts);
});
contract('GANToken - Mintable test', function (accounts) {
  mintable(token, accounts);
});
contract('GANToken - Ownable test', function (accounts) {
  ownable(token, accounts);
});
contract('GANToken - Additional conditions test', function (accounts) {
  additional(token, accounts);
});
