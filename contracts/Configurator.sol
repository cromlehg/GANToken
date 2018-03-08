pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './MintableToken.sol';
import './GANToken.sol';
import './PreICO.sol';
import './ICO.sol';
import './FreezeTokensWallet.sol';

contract Configurator is Ownable {

  MintableToken public token;

  PreICO public preICO;

  ICO public ico;

  FreezeTokensWallet public teamTokensWallet;

  FreezeTokensWallet public gaffTokensWallet;

  function deploy() public onlyOwner {

    token = new GANToken();

    preICO = new PreICO();

    preICO.setWallet(0xa86780383E35De330918D8e4195D671140A60A74);
    preICO.setStart(1518393600);
    preICO.setPrice(8600000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setToken(token);
    preICO.setHardcap(17500000000000000000000);
    preICO.setSoftcap(3500000000000000000000);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);

    token.setSaleAgent(preICO);

    ico = new ICO();

    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setToken(token);
    ico.setPrice(8600000000000000000000);
    ico.setWallet(0x98882D176234AEb736bbBDB173a8D24794A3b085);
    ico.setBountyTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setAdvisorsTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setServiceTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setStart(1520640000);
    ico.setHardcap(40500000000000000000000);
    ico.setAdvisorsTokensPercent(6);
    ico.setBountyTokensPercent(2);
    ico.setTeamTokensPercent(5);
    ico.setServiceTokensPercent(2);
    ico.setTokensLimit(1200000000000000000000000000);

    teamTokensWallet = new FreezeTokensWallet();
    teamTokensWallet.setPeriod(360);
    teamTokensWallet.setToken(token);
    ico.setTeamTokensWallet(teamTokensWallet);
    teamTokensWallet.transferOwnership(ico);

    gaffTokensWallet = new FreezeTokensWallet();
    gaffTokensWallet.setPeriod(360);
    gaffTokensWallet.setToken(token);
    ico.setGAFFTokensWallet(gaffTokensWallet);
    gaffTokensWallet.transferOwnership(ico);

    preICO.setNextSaleAgent(ico);

    address manager = 0x675eDE27cafc8Bd07bFCDa6fEF6ac25031c74766;

    token.transferOwnership(manager);
    preICO.transferOwnership(manager);
    ico.transferOwnership(manager);
  }

}

