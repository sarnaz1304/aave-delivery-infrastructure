// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

library Math {
  /**
   * @notice method to get a pseudo random number from block timestamp, block number, prevrandao and an entropy value
   * @param entropy number assigned by method caller to give certain entropy to the pseudo random generation
   * @return a pseudo random number
   */
  function getPseudoRandom(uint256 entropy) internal view returns (uint256) {
    return
      uint256(
        keccak256(abi.encodePacked(block.number - 1, block.timestamp, block.prevrandao, entropy))
      );
  }

  /**
   * @notice method to shuffle an array of forwarder configurations
   * @param arrayToShuffle array that needs to be shuffled
   * @return shuffled array of forwarder configurations
   */
  function shuffleUint256Array(
    uint256[] memory arrayToShuffle
  ) internal view returns (uint256[] memory) {
    uint256 arrayLength = arrayToShuffle.length;
    for (uint256 i = 0; i < arrayLength; i++) {
      uint256 j = Math.getPseudoRandom(i) % arrayLength;
      uint256 arrayItem = arrayToShuffle[i];
      arrayToShuffle[i] = arrayToShuffle[j];
      arrayToShuffle[j] = arrayItem;
    }
    return arrayToShuffle;
  }
}
