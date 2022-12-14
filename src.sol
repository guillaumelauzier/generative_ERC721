pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

// GenerativeERC721 is a subclass of ERC721 that generates unique token IDs
// based on a random seed and a mathematical formula
contract GenerativeERC721 is ERC721 {
  uint256 public seed;

  // Generate a unique token ID based on the seed and a formula
  function generateTokenId(uint256 index) public view returns (uint256) {
    return uint256(uint256(keccak256(abi.encodePacked(seed, index))) / (index + 1));
  }

  // Override the ERC721 "mint" function to use the generateTokenId function
  // to generate a unique token ID for each new token
  function mint(address to, uint256 tokenId) public onlyOwner {
    _mint(to, generateTokenId(tokenId));
  }
}
