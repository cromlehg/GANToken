pragma solidity ^0.4.18;

import './ownership/Ownable.sol';

contract GANToken {
  function setSaleAgent(address newSaleAgent) public;
  function transferOwnership(address newOwner) public;
}

contract PreICO {
  function setWallet(address newWallet) public;
  function addMilestone(uint period, uint bonus) public;
  function setStart(uint newStart) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setHardcap(uint newHardcap) public;
  function setSoftcap(uint newSoftcap) public;
  function setNextSaleAgent(address newICO) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract ICO {
  function addMilestone(uint period, uint bonus) public;
  function setStart(uint newStart) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function setAdvisorsTokensWallet(address newAdvisorsTokensWallet) public;
  function setBountyTokensWallet(address newBountyWallet) public;
  function setServiceTokensWallet(address newServiceTokensWallet) public;
  function setTeamTokensWallet(address newTeamTokensWallet) public;
  function setGAFFTokensWallet(address newGAFFTokensWallet) public;
  function setAdvisorsTokensPercent(uint newAdvisorsTokensPercent) public;
  function setBountyTokensPercent(uint newBountyTokensPercent) public;
  function setServiceTokensPercent(uint newServiceTokensPercent) public;
  function setTeamTokensPercent(uint newTeamTokensPercent) public;
  function setTokensLimit(uint newTokensLimit) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract FreezeTokensWallet {
  function setPeriod(uint newPeriod) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract TestConfigurator is Ownable {
  GANToken public token;
  PreICO public preICO;
  ICO public ico;
  FreezeTokensWallet public teamTokensWallet;
  FreezeTokensWallet public gaffTokensWallet;

  function setToken(address _token) public onlyOwner {
    token = GANToken(_token);
  }

  function setPreICO(address _preICO) public onlyOwner {
    preICO = PreICO(_preICO);
  }

  function setICO(address _ico) public onlyOwner {
    ico = ICO(_ico);
  }

  function setTeamTokensWallet(address _teamTokensWallet) public onlyOwner {
    teamTokensWallet = FreezeTokensWallet(_teamTokensWallet);
  }

  function setGAFFTokensWallet(address _gaffTokensWallet) public onlyOwner {
    gaffTokensWallet = FreezeTokensWallet(_gaffTokensWallet);
  }

  function deploy() public onlyOwner {
    preICO.setStart(1518393600);
    preICO.setWallet(0xa86780383E35De330918D8e4195D671140A60A74);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);
    preICO.setPrice(8600000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setHardcap(17500000000000000000000);
    preICO.setSoftcap(3500000000000000000000);
    preICO.setToken(token);

    token.setSaleAgent(preICO);
    preICO.setNextSaleAgent(ico);

    ico.setStart(1520640000);
    ico.setWallet(0x98882D176234AEb736bbBDB173a8D24794A3b085);
    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setPrice(8600000000000000000000);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setHardcap(40500000000000000000000);
    ico.setBountyTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setAdvisorsTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setServiceTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setAdvisorsTokensPercent(6);
    ico.setBountyTokensPercent(2);
    ico.setTeamTokensPercent(5);
    ico.setServiceTokensPercent(2);
    ico.setTokensLimit(1200000000000000000000000000);
    ico.setToken(token);

    ico.setTeamTokensWallet(teamTokensWallet);
    teamTokensWallet.setPeriod(360);
    teamTokensWallet.setToken(token);
    teamTokensWallet.transferOwnership(ico);

    ico.setGAFFTokensWallet(gaffTokensWallet);
    gaffTokensWallet.setPeriod(360);
    gaffTokensWallet.setToken(token);
    gaffTokensWallet.transferOwnership(ico);

    token.transferOwnership(owner);
    preICO.transferOwnership(owner);
    ico.transferOwnership(owner);
  }
}
