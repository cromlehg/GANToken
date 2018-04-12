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

    preICO.setWallet(0x1AA6F6c5bd4f56e2f57a5F8c0ECC549E9A8a944D);
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
    ico.setWallet(0x4fcE3E532Aadd2119fd9012971D9E161aB27896E);
    ico.setBountyTokensWallet(0x0CAb6DA6020489DD510bA88A891b7D08c905254A);
    ico.setAdvisorsTokensWallet(0x8B7a83c35CAdedC04BA73b874705661DC2039335);
    ico.setServiceTokensWallet(0x0b06DE4D5BB9D06B702fED24C763E976B7d3c36f);
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

    address manager = 0xAa2e8e600c3874BD26a86c9A5873a24b855Be1EC;

    token.transferOwnership(manager);
    preICO.transferOwnership(manager);
    ico.transferOwnership(manager);
  }

}

