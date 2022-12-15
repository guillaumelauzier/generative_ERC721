pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
  // Define the name, symbol, and total supply of the token
  string public name = "My NFT";
  string public symbol = "MYNFT";
  uint256 public totalSupply;

  // Define an array to store the token IDs
  uint256[] public tokenIds;

  // Define a mapping to store the token metadata
  mapping(uint256 => TokenMetadata) public tokenMetadata;

  // The struct that defines the metadata for a token
  struct TokenMetadata {
    string name;
    string image;
  }

  // The constructor sets the total supply and generates the first token
  constructor() public {
    totalSupply = 1;
    tokenIds.push(1);
    tokenMetadata[1] = TokenMetadata("My first NFT", "https://example.com/my-first-nft.jpg");
  }

  // The function that allows a token to be transferred
  function transferFrom(address _from, address _to, uint256 _tokenId) public {
    // Ensure the token ID exists
    require(tokenMetadata[_tokenId].name != "");

    // Ensure the sender has the token
    require(_from.balanceOf(_tokenId) > 0);

    // Transfer the token
    _from.transferFrom(_to, _tokenId);
  }

  // The function that allows a token's metadata to be updated
  function setTokenMetadata(uint256 _tokenId, string _name, string _image) public {
    // Ensure the token ID exists
    require(tokenMetadata[_tokenId].name != "");

    // Update the metadata
    tokenMetadata[_tokenId] = TokenMetadata(_name, _image);
  }
}
