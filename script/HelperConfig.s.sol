// SPDX-License-Identifier: MIT
// 1. Deploy mocks when we are on local anvil chain
// 2. Keep track of contract addresses accross different chains

pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { MockV3Aggregator } from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script{
   // If we are on local anvil, we deploy mocks
   // otherwise, grab the existing address from the live network 
   NetworkConfig public activeNetworkConfig;
   uint public constant DECIMALS = 8;
   uint public constant INITIAL_PRICE = 2000e8;

   struct NetworkConfig {
      address priceFeed; // EthUsd price feed address
   }

   constructor(){
      if(block.chainid == 11155111){
         activeNetworkConfig = getSepoliaEthConfig();
      } else if(block.chainid == 1){
         activeNetworkConfig = getMainnetEthConfig();
      } else {
         activeNetworkConfig = getAnvilEthConfig();
      }
   }

   function getSepoliaEthConfig() public pure returns(NetworkConfig memory){
      // All we need is the price feed address
      // vrf address
      NetworkConfig memory sepoliaConfig = NetworkConfig({
         priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
      });
      return sepoliaConfig;
   }

   
   function getMainnetEthConfig() public pure returns(NetworkConfig memory){
      NetworkConfig memory ethConfig = NetworkConfig({
         priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
      });
      return ethConfig;
   }

   function getAnvilEthConfig() public pure returns(NetworkConfig memory){
      // All we need is the price feed address
      // 1. Deploy mocks
      // 2. Return the mock addresses

      vm.startBroadcast();
      MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE)
      vm.stopBroadcast();

      NetworkConfig memory anvilConfig = NetworkConfig({
         priceFeed: mockPriceFeed.latestAnswer()
         // priceFeed: address(mockPriceFeed)
      });
      return anvilConfig;
   }

}