// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script{

   function run() external returns(FundMe){
      // Anything before "startBroadcast" will not be a real transaction
      HelperConfig helperConfig = new HelperConfig();
      address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

      // Anything after "startBroadcast" will be a real transaction
      vm.startBroadcast();
      FundMe fundMe = new FundMe(ethUsdPriceFeed);
      vm.stopBroadcast();
      return fundMe;
   }
}