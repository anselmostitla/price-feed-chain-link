## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

### foundry

```commands
$ forge init
$ forge test
$ forge install smartcontractkit/chainlink-brownie-contracts@0.6.1 --no-commit
$ forge build (to compile)
forge test -vv (prints through the console.log)
source .env (to be able to use environment variables)
echo $SEPOLIA_RPC_URL (to check if we can use this specific environment variable)
forge test test/FundMeTest.t.sol -vvvv --fork-url $SEPOLIA_RPC_URL (it will simulate as if all our transactions actually are running on sepolia network)
forge coverage --fork-url $SEPOLIA_RPC_URL (this give us a signal of how much our code is tested in terms of percentage)
For any of you who are having trouble trying to run a particular test, forge test -m is deprecated, use forge test --match-test (or forge test --mt) instead
```

### To make the remappings, add to foundry.toml
```
remappings = ["@chainlink/contracts/=lib/chainlink-brownie-contracts/contracts/"]
```


### This tutorial is base on 
```
https://youtu.be/sas02qSFZ74?si=tsBxnTrWa-1Zf6Ba
https://youtu.be/sas02qSFZ74?si=k4VrtFlkV4SqPvx4&t=3644
```

At minute 51:36 i failed to run
