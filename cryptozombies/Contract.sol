// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// Initialize contract
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

    // Functions
    function _createZombie(string memory _name, uint _dna) private {
        // Fire and event
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
