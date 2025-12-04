# MyToken (MTK)

## Overview
MyToken is a simple ERC-20 compatible token built on the Ethereum blockchain for learning purposes. It implements the core standards required for a functional cryptocurrency, including transfers, allowances, and event logging.

## Token Details
- **Name**: MyToken
- **Symbol**: MTK
- **Decimals**: 18
- **Total Supply**: 1,000,000 MTK
- **Contract Address**: [REPLACE_WITH_YOUR_CONTRACT_ADDRESS_FROM_REMIX]

## Features
- ? **Standard ERC-20 Implementation**: Fully compatible with wallets and exchanges.
- ? **Transfer**: Users can send tokens to any Ethereum address.
- ? **Allowances**: Users can approve third parties (like DEXs) to spend tokens on their behalf.
- ? **Events**: Emits `Transfer` and `Approval` events for on-chain tracking.
- ? **Safety**: Includes validation for zero-addresses and insufficient balances.

## How to Deploy
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a new file named `MyToken.sol`.
3. Paste the smart contract source code.
4. Compile using Solidity compiler version `0.8.x`.
5. Navigate to the "Deploy & Run" tab.
6. Enter the initial supply (with 18 zeros) in the deploy parameter.
7. Click "Deploy".

## Usage Examples

### Check Balance
Call the `balanceOf` function with an address:
```solidity
balanceOf("0xYourAddress...")