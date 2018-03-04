![GAN Token](logo.png "GAN Token")

# GAN Token smart contract

* _Standard_        : [ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)
* _[Name](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#name)_           : GAN Token
* _[Ticker](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#symbol)_       : GAN
* _[Decimals](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#decimals)_   : 18
* _Emission_                                                                           : Mintable
* _Crowdsales_                                                                         : 2
* _Fiat dependency_                                                                    : No
* _Tokens locked_                                                                      : Yes

## Smart-contracts description

The tokens for the bounty and the team are minted after the ICO  is finished.  
There is a special function to return 3rd party tokens that were sent by mistake (function retrieveTokens()).  
Each stage has a direct minting function in wei. This is made to support the external payment gateways.

### Contracts contains
1. _GANToken_ - Token contract
2. _PreICO_ - PreICO contract
3. _ICO_ - ICO contract
4. _Configurator_ - contract with main configuration for production

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5073514).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

Contract manager must call finishMinting after each crowdsale milestone!
To support external mint service manager should specify address by calling _setDirectMintAgent_. After that specified address can direct mint tokens by calling _mintTokensByETHExternal_ and _mintTokensExternal_.

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 ETH) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Tokens distribution

* _Bounty tokens percent_                        : 2%
* _Team tokens percent_                          : 5% (12 month lock)
* _Advisors tokens percent_                      : 6%
* _Marketing and Audit (Service) tokens percent_ : 2%
* _For sale tokens percent_                      : 85%
* __Additionally minted tokens (1 200 000 000 minus distributed) to Global-ads Fund Fund wallet with 12 month freeze)__

Tokens can be mint additionaly if needs to Global-ads Fund wallet with freeze.

## Main network configuration

* _Bounty tokens wallet_                         : 
* _Advisors tokens wallet_                       : 
* _Marketing and Audit (Service) tokens wallet_  :
* _Contracts manager_                            :

### Links
1. _Token_ -
2. _PreICO_ -
3. _ICO_ -

### Features
* Manually mint tokens by owner or sale agent at any time until token minting finished. 
* Manually mint tokens in ether value by owner or sale agent at corresponding sale contract during current sale processing.  

### Crowdsale stages

#### PreICO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 8600 Tokens
* _Hardcap_                     : 17 500 ETH
* _Softcap_                     : 3500 ETH
* _Start_                       : 
* _Wallet_                      : 

##### Milestones
1. 1 day, bonus +40%
2. 13 days, bonus +30%

#### ICO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 8600 Tokens
* _Hardcap_                     : 40 500 ETH
* _Start_                       : 
* _Wallet_                      : 
 
##### Milestones
1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 

