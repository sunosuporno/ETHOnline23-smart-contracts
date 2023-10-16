pragma solidity 0.8.19;

import {IPool} from "./Ipool.sol";

contract GoerliConnector {

    IPool public pool;
    constructor(address _pool) {
        pool = IPool(_pool);
    }

    function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) public {
        pool.supply(asset, amount, onBehalfOf, referralCode);
    }

    function withdraw(address asset, uint256 amount, address to) public {
        pool.withdraw(asset, amount, to);
    }

    function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode, address onBehalfOf) public {
        pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
    }

    function _executeCall(bytes calldata data) internal{
        (bool success, bytes memory returnData) = address(pool).call(data);
        require(success, "GoerliConnector: call failed");
    }
}