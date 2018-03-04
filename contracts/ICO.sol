pragma solidity ^0.4.18;

import './ConfiguredCommonSale.sol';
import './FreezeTokensWallet.sol';

contract ICO is ConfiguredCommonSale {

  address public bountyTokensWallet;

  address public advisorsTokensWallet;
  
  FreezeTokensWallet public teamTokensWallet;

  address public serviceTokensWallet;

  FreezeTokensWallet public gaffTokensWallet;

  uint public bountyTokensPercent;
  
  uint public advisorsTokensPercent;

  uint public teamTokensPercent;

  uint public serviceTokensPercent;

  uint public tokensLimit;

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }
  
  function setAdvisorsTokensPercent(uint newAdvisorsTokensPercent) public onlyOwner {
    advisorsTokensPercent = newAdvisorsTokensPercent;
  }

  function setTeamTokensPercent(uint newTeamTokensPercent) public onlyOwner {
    teamTokensPercent = newTeamTokensPercent;
  }

  function setServiceTokensPercent(uint newServiceTokensPercent) public onlyOwner {
    serviceTokensPercent = newServiceTokensPercent;
  }

  function setTokensLimit(uint newTokensLimit) public onlyOwner {
    tokensLimit = newTokensLimit;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function setAdvisorsTokensWallet(address newAdvisorsTokensWallet) public onlyOwner {
    advisorsTokensWallet = newAdvisorsTokensWallet;
  }

  function setTeamTokensWallet(address newTeamTokensWallet) public onlyOwner {
    teamTokensWallet = FreezeTokensWallet(newTeamTokensWallet);
  }

  function setServiceTokensWallet(address newServiceTokensWallet) public onlyOwner {
    serviceTokensWallet = newServiceTokensWallet;
  }

  function setGAFFTokensWallet(address newGAFFTokensWallet) public onlyOwner {
    gaffTokensWallet = FreezeTokensWallet(newGAFFTokensWallet);
  }

  function finish() public onlyOwner {
    uint summaryTokensPercent = bountyTokensPercent.add(advisorsTokensPercent).add(teamTokensPercent).add(serviceTokensPercent);
    uint mintedTokens = token.totalSupply();
    uint allTokens = mintedTokens.mul(percentRate).div(percentRate.sub(summaryTokensPercent));
    uint advisorsTokens = allTokens.mul(advisorsTokensPercent).div(percentRate);
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(percentRate);
    uint teamTokens = allTokens.mul(teamTokensPercent).div(percentRate);
    uint serviceTokens = allTokens.mul(serviceTokensPercent).div(percentRate);
    mintTokens(advisorsTokensWallet, advisorsTokens);
    mintTokens(bountyTokensWallet, bountyTokens);
    mintTokens(teamTokensWallet, teamTokens);
    mintTokens(serviceTokensWallet, serviceTokens);
    mintedTokens = token.totalSupply();
    if(mintedTokens < tokensLimit) {
      mintTokens(gaffTokensWallet, tokensLimit.sub(mintedTokens));
    }
    token.finishMinting();
    gaffTokensWallet.start();
    teamTokensWallet.start();
    gaffTokensWallet.transferOwnership(owner);
    teamTokensWallet.transferOwnership(owner);
  }

}
