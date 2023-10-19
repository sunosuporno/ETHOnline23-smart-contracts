// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// import {IPool} from "./Ipool.sol";
// import {IERC20} from "./IERC20.sol";
import {HyperlaneConnectionClient} from "contracts/HyperlaneConnectionClient.sol";

contract GoerliConnector is HyperlaneConnectionClient {
    // IPool public pool;
    // IERC20 public dai;

    // constructor(address _pool, address _daiAddress) {
    //     pool = IPool(_pool);
    //     dai = IERC20(_daiAddress);
    // }

    // /**
    // @notice Spark protocol functions - supply, withdraw, borrow, repay
    // recives the data from the main contract and executes the function
    // */
    // function supplyData(
    //     address asset,
    //     uint256 amount,
    //     address onBehalfOf,
    //     uint16 referralCode
    // ) public {
    //     //dai approve code
    //     dai.approve(address(pool), amount);
    //     pool.supply(asset, amount, onBehalfOf, referralCode);
    // }

    // function withdraw(address asset, uint256 amount, address to) public {
    //     pool.withdraw(asset, amount, to);
    // }

    // function borrow(
    //     address asset,
    //     uint256 amount,
    //     uint256 interestRateMode,
    //     uint16 referralCode,
    //     address onBehalfOf
    // ) public {
    //     pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
    // }

    // function repay(
    //     address asset,
    //     uint256 amount,
    //     uint256 rateMode,
    //     address onBehalfOf
    // ) public {
    //     //dai approve code
    //     dai.approve(address(pool), amount);
    //     pool.repay(asset, amount, rateMode, onBehalfOf);
    // }

    // function _executeCall(bytes calldata data) internal {
    //     (bool success, bytes memory returnData) = address(this).call(data);
    //     require(success, "GoerliConnector: call failed");
    // }

    // function handle(_origin, sender, _message) external override onlyMailbox {
    //     _executeCall(_message);
    // }

    function deposit(uint256 amount, address safeAddress) external {
        dai.approve(address(this), amount);
        dai.transferFrom(msg.sender, address(this), amount);
        bytes memory message = abi.encodeWithSelector(
            "transferFrom(address, address, uint256)",
            address(this),
            safeAddress,
            amount
        );
        mailbox.dispatch(5, safeAddress, message);
    }
}
