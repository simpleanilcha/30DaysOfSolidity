// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./zombieattack.sol";
// Import file here
import "./erc721.sol";

// Declare ERC721 inheritance here
abstract contract ZombieOwnership is ZombieAttack, ERC721 {

}