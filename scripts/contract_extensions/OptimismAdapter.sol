// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.8;

import {TestNetChainIds} from 'solidity-utils/contracts/utils/ChainHelpers.sol';
import {IOpAdapter, OpAdapter} from '../../src/contracts/adapters/optimism/OpAdapter.sol';

/**
 * @title OptimismAdapterTestnet
 * @author BGD Labs
 */
contract OptimismAdapterTestnet is OpAdapter {
  /**
   * @param crossChainController address of the cross chain controller that will use this bridge adapter
   * @param ovmCrossDomainMessenger optimism entry point address
   * @param trustedRemotes list of remote configurations to set as trusted
   */
  constructor(
    address crossChainController,
    address ovmCrossDomainMessenger,
    uint256 providerGasLimit,
    TrustedRemotesConfig[] memory trustedRemotes
  )
    OpAdapter(
      crossChainController,
      ovmCrossDomainMessenger,
      providerGasLimit,
      'Optimism native adapter',
      trustedRemotes
    )
  {}

  /// @inheritdoc IOpAdapter
  function isDestinationChainIdSupported(uint256 chainId) public pure override returns (bool) {
    return chainId == TestNetChainIds.OPTIMISM_SEPOLIA;
  }

  /// @inheritdoc IOpAdapter
  function getOriginChainId() public pure override returns (uint256) {
    return TestNetChainIds.ETHEREUM_SEPOLIA;
  }
}
