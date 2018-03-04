pragma solidity ^0.4.18;

import './ConfiguredCommonSale.sol';
import './SoftcapFeature.sol';
import './NextSaleAgentFeature.sol';

contract PreICO is NextSaleAgentFeature, SoftcapFeature, ConfiguredCommonSale {

  function mintTokensByETH(address to, uint _invested) internal returns(uint) {
    uint _tokens = super.mintTokensByETH(to, _invested);
    updateBalance(to, _invested);
    return _tokens;
  }

  function finish() public onlyOwner {
    if (updateRefundState()) {
      token.finishMinting();
    } else {
      withdraw();
      token.setSaleAgent(nextSaleAgent);
    }
  }

  function fallback() internal minInvestLimited(msg.value) returns(uint) {
    require(now >= start && now < endSaleDate());
    return mintTokensByETH(msg.sender, msg.value);
  }

}
