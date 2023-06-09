// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "./zombieattack.sol";
import "./erc721.sol";
import "./safemath.sol";

/// TODO: Replace this with natspec descriptions
/// @title A contract that manages transfering zombie ownership
/// @author ANIL MAHARJAN
/// @dev Compliant with OpenZeppelin's implementation of the ERC721 spec draft
abstract contract ZombieOwnership is ZombieAttack, ERC721 {

  mapping (uint => address) zombieApprovals;

  function balanceOf(address _owner) external view returns (uint256) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return zombieToOwner[_tokenId];
  }

  function _transfer(address _from, address _to, uint256 _tokenId) private {
    // 1. Replace with SafeMath's `add`
    ownerZombieCount[_to] = ownerZombieCount[_to].add(1);
    // 2. Replace with SafeMath's `sub`
    ownerZombieCount[_from] = ownerZombieCount[_from].sub(1);
    zombieToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {
    require (zombieToOwner[_tokenId] == msg.sender || zombieApprovals[_tokenId] == msg.sender);
    _transfer(_from, _to, _tokenId);
  }

  // 1. Add function modifier here
  function approve(address _approved, uint256 _tokenId) external payable onlyOwnerOf(_tokenId){
    // 2. Define function here
    zombieApprovals[_tokenId] = _approved;
    //Fire the Approval event here
    emit Approval(msg.sender, _approved, _tokenId);
  }

}