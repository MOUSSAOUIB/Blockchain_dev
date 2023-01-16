# Ethers Simple Storage

## Dependencies

```
> Install Solidity compiler solc-js
[#corepack enable]
yarn add solc
yarn add solc@0.8.7-fixed

> Install ethers

 yarn add ethers

Install Ganach

Install dotenv  (.env manager)
yarn add dotenv

> Install prettier for solidity & js  ( nmp package)
yarn add prettier prettier-plugin-solidity

```

## Scripts

```
> Compile a contract
yarn solcjs --bin --abi --include-path node_modules/ --base-path . -o . contractName.sol

```
