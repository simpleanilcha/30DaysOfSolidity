// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
  // 1. Create a `public` variable named `priceFeed` of type `AggregatorV3Interface`.
  AggregatorV3Interface public priceFeed;

  // 2. Create a constructor
  constructor() public {
    // 3. Instantiate the `AggregatorV3Interface` contract
    priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
  }

  // Start here
  function getLatestPrice() public view returns (int) {
    (,int price,,,) = priceFeed.latestRoundData();
    return price;
  }
}
