pragma solidity 0.8.19;

import {HyperlaneConnectionClient} from "contracts/HyperlaneConnectionClient.sol";

contract MainContract is HyperlaneConnectionClient {
    address public goerliConnector;

    function setGoerliConnector(address _goerliConnector) external {
        goerliConnector = _goerliConnector;
    }

    function supply(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
    ) external {
        // pool.supply(asset, amount, onBehalfOf, referralCode);
        bytes memory data = abi.encodeWithSelector(
            "supply(address,uint256,address,uint16)",
            asset,
            amount,
            onBehalfOf,
            referralCode
        );
        sendTxn(data);
    }

    function withdraw(address asset, uint256 amount, address to) external {
        // pool.withdraw(asset, amount, to);
        bytes memory data = abi.encodeWithSelector(
            "withdraw(address,uint256,address)",
            asset,
            amount,
            to
        );
        sendTxn(data);
    }

    function borrow(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        uint16 referralCode,
        address onBehalfOf
    ) external {
        // pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
        bytes memory data = abi.encodeWithSelector(
            "borrow(address,uint256,uint256,uint16,address)",
            asset,
            amount,
            interestRateMode,
            referralCode,
            onBehalfOf
        );
        sendTxn(data);
    }

    function repay(
        address asset,
        uint256 amount,
        uint256 rateMode,
        address onBehalfOf
    ) external {
        // pool.repay(asset, amount, rateMode, onBehalfOf);
        bytes memory data = abi.encodeWithSelector(
            "repay(address,uint256,uint256,address)",
            asset,
            amount,
            rateMode,
            onBehalfOf
        );
        sendTxn(data);
    }

    function sendTxn(bytes memory data) external {
        mailbox.dispatch(4, goerliConnector, data);
    }
}
