// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {HyperlaneConnectionClient} from "contracts/HyperlaneConnectionClient.sol";

contract MainContract is HyperlaneConnectionClient {
    address public goerliConnector;

    /**
    @notice Spark protocol functions - supply, withdraw, borrow, repay
    
     */

    function setGoerliConnector(address _goerliConnector) external {
        goerliConnector = _goerliConnector;
    }

    function supply(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
    ) external pure returns (bytes memory) {
        // pool.supply(asset, amount, onBehalfOf, referralCode);
        bytes memory data = abi.encodeWithSelector(
            "supply(address,uint256,address,uint16)",
            asset,
            amount,
            onBehalfOf,
            referralCode
        );
        return data;
    }

    function withdraw(
        address asset,
        uint256 amount,
        address to
    ) external pure returns (bytes memory) {
        // pool.withdraw(asset, amount, to);
        bytes memory data = abi.encodeWithSelector(
            "withdraw(address,uint256,address)",
            asset,
            amount,
            to
        );
        return data;
    }

    function borrow(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        uint16 referralCode,
        address onBehalfOf
    ) external pure returns (bytes memory) {
        // pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
        bytes memory data = abi.encodeWithSelector(
            "borrow(address,uint256,uint256,uint16,address)",
            asset,
            amount,
            interestRateMode,
            referralCode,
            onBehalfOf
        );

        return data;
    }

    function repay(
        address asset,
        uint256 amount,
        uint256 rateMode,
        address onBehalfOf
    ) external pure returns (bytes memory) {
        // pool.repay(asset, amount, rateMode, onBehalfOf);
        bytes memory data = abi.encodeWithSelector(
            "repay(address,uint256,uint256,address)",
            asset,
            amount,
            rateMode,
            onBehalfOf
        );
        return data;
    }
}
