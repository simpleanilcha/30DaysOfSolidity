// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract ZombieFactory is VRFConsumerbase {

  uint dnaDigits = 16;
  uint dnaModulus = 10 ** dnaDigits;

  // 1. Define the `keyHash`, `fee`, and `randomResult` variables. Don't forget to make them `public`.
  bytes32 public keyHash;
  uint256 public fee;
  uint256 public randomResult;

  struct Zombie {
    string name;
    uint dna;
  }

  Zombie[] public zombies;

  // 2. Create a constructor
    constructor() VRFConsumerBase(
      0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, // VRF Coordinator
      0x01BE23585060835E02B77ef475b0Cc51aA1e0709  // LINK Token
    ) public{
      // 2. Fill in the body
      keyHash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
      fee = 100000000000000000;
    }

  function _createZombie(string memory _name, uint _dna) private {
    zombies.push(Zombie(_name, _dna));
  }

  // 1. Create the `getRandomNumber` function
    function getRandomNumber() public returns (bytes32 requestId) {
      return requestRandomness(keyHash, fee);
    }

    // 2. Create the `fulfillRandomness` function
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
      randomResult = randomness;
    }

  function _generatePseudoRandomDna(string memory _str) private view returns (uint) {
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand % dnaModulus;
  }
}
