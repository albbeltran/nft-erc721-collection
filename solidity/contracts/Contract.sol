// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 
contract Faces is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
 
  constructor() ERC721("Faces", "FC") {}
 
  function mintFace(address player, string memory tokenURI)
      public
      returns (uint256)
  {
      uint256 newItemId = _tokenIds.current();
      _mint(player, newItemId);
      _setTokenURI(newItemId, tokenURI);
 
      _tokenIds.increment();
      return newItemId;
  }
}
