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

* _Bounty tokens wallet_                         : 0x0CAb6DA6020489DD510bA88A891b7D08c905254A
* _Advisors tokens wallet_                       : 0x8B7a83c35CAdedC04BA73b874705661DC2039335
* _Marketing and Audit (Service) tokens wallet_  : 0x0b06DE4D5BB9D06B702fED24C763E976B7d3c36f
* _Contracts manager_                            : 0xAa2e8e600c3874BD26a86c9A5873a24b855Be1EC

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
* _Wallet_                      : 0x1AA6F6c5bd4f56e2f57a5F8c0ECC549E9A8a944D

##### Milestones
1. 1 day, bonus +40%
2. 13 days, bonus +30%

#### ICO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 8600 Tokens
* _Hardcap_                     : 40 500 ETH
* _Start_                       : 
* _Wallet_                      : 0x4fcE3E532Aadd2119fd9012971D9E161aB27896E
 
##### Milestones
1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 


## Ropsten network configuration 

### links
1. _Token_ - https://ropsten.etherscan.io/address/0xf86554c3b5242d25b2e84b56d18e35ddc49f2569
2. _PreICO_ - https://ropsten.etherscan.io/address/0xb740250795c079db1deed933f71cf5b9f96d3837
3. _ICO_ - https://ropsten.etherscan.io/address/0xedf0555b98e6fb9eaff5bc52388d72e77632b07d
4. _Team Tokens Wallet_ - https://ropsten.etherscan.io/address/0xe2db37d0e3ceda1ce027d022155bc8b8267f6095
5. _GAFF Tokens Wallet_ - https://ropsten.etherscan.io/address/0x22d029342bb545a2a886d8a877f06c29eb453ff2


### Crowdsale stages

#### PreICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 8600 Tokens
* _Hardcap_                     : 1.75 ETH
* _Softcap_                     : 0.35 ETH
* _Start_                       : 05 Mar 2018 00:00:00 GMT
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82

_Milestones_

1. 1 day, bonus +40%
2. 13 days, bonus +30%

##### Purchasers

* 1 ETH => 11180 tokens (30% bonus), gas = 152672
https://ropsten.etherscan.io/tx/0x3fa5d66deb4d88cc73935e0fed1f56a26985386fb82693878f3b34a36d602ce1

* 1.1 ETH => 12298 tokens (30% bonus), gas = 72035
https://ropsten.etherscan.io/tx/0xd59022592bcf0fc884a0e5133abdc62f41b50b21376df5d3ff8f24532856b8cb

* 1 ETH => rejected txn, hardcap is reached, gas = 22515
https://ropsten.etherscan.io/tx/0x4e4ec20cc2e133b18172a61e3afb99e51b351858fdaeef8b5d16e4d10a62d0d5

##### Service operations

* finish, gas = 47309
https://ropsten.etherscan.io/tx/0xd4dfbf3153757a3c453e52798b59d20d5e9925675f52aa504b666ea5b0f7c3b1

#### ICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 8600 Tokens
* _Hardcap_                     : 40 500 ETH
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82
* _Start_                       : 05 Mar 2018 00:00:00 GMT
* _Bounty tokens percent_       : 2%
* _Advisors tokens percent_     : 6%
* _Service tokens percent_      : 2%
* _Team tokens percent_         : 5% (12 month lock)
* _Bounty tokens wallet_        : 0x8Ba7Aa817e5E0cB27D9c146A452Ea8273f8EFF29
* _Advisors tokens wallet_      : 0x24a7774d0eba02846580A214eeca955214cA776C
* _Service tokens wallet_       : 0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca

_Milestones_

1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 

##### Purchasers
  
* 1 ETH => 10750 tokens (25% bonus), gas = 87631
https://ropsten.etherscan.io/tx/0xa93495f98af1c45161039595e5209a03c244af9498718ae6ec47b2c306d9f7ca

* 0.01 ETH => rejected txn, less then mininal investment limit, gas = 21297
https://ropsten.etherscan.io/tx/0x8dc82e6ef39f69e1cfd727796e38c962ddf1257a58270d78f322c6cd66f4d80d

* 1 ETH => 9890 tokens (15% bonus), gas = 74063
https://ropsten.etherscan.io/tx/0x09d3cc91c6485fb6c5bafefb365a327b2d441565770448ae538b86369ef6b742

##### Service operations

* setStart, gas = 28262
https://ropsten.etherscan.io/tx/0xfb9277aa6f29122a2a86cca5574fefa9746fe2b79b379304e595b19fa6414f1a

* finish, gas = 357787
https://ropsten.etherscan.io/tx/0x9c9cede67c233f4ec57d3a7475396e4dc5fdeb399320d7fc130f275525411ec0

##### Token holders
https://ropsten.etherscan.io/token/0xf86554c3b5242d25b2e84b56d18e35ddc49f2569#balances
