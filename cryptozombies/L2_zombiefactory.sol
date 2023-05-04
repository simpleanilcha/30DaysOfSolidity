// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract ZombieFactory {

    // declare event
    event NewZombie(uint zombieId, string name, uint dna);

    // State variables & Integers
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    // Structs
    struct Zombie {
        string name;
        uint dna;
    }

    // Arrays
    Zombie[] public zombies;

    // mappings here
    mapping(uint => address) public zombieToOwner;
    mapping(address => uint) ownerZombieCount;

    // Functions
    function _createZombie(string memory _name, uint _dna) internal {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length - 1;
        // msg.sender
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        // Fire and event
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
      // require
      require(ownerZombieCount[msg.sender] == 0);
      uint randDna = _generateRandomDna(_name);
      _createZombie(_name, randDna);
    }

}