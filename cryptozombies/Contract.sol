// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// Initialize contract
contract ZombieFactory {

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
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {

    }

}
