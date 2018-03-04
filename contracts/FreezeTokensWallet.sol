pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './math/SafeMath.sol';
import './MintableToken.sol';

contract FreezeTokensWallet is Ownable {

  using SafeMath for uint256;

  MintableToken public token;

  bool public started;

  uint public lockPeriod;

  uint public unlockDate;

  modifier notStarted() {
    require(!started);
    _;
  }

  function setPeriod(uint newLockPeriod) public onlyOwner notStarted {
    lockPeriod = newLockPeriod * 1 days;
  }

  function setToken(address newToken) public onlyOwner notStarted {
    token = MintableToken(newToken);
  }

  function start() public onlyOwner notStarted {
    unlockDate = now + lockPeriod;
    started = true;
  }

  function retrieveTokens(address to) public onlyOwner {
    require(now >= unlockDate);
    token.transfer(to, token.balanceOf(this));
  }

}
