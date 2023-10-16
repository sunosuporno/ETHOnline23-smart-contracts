pragma solidity 0.8.19;

import {IPool} from "./Ipool.sol";

contract GoerliConnector {

    IPool public pool;
    address public daiAddress;
    constructor(address _pool, address _daiAddress) {
        pool = IPool(_pool);
        daiAddress = _daiAddress;
    }
    /**

    */
    function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) public {
        pool.supply(asset, amount, onBehalfOf, referralCode);
    }

    function withdraw(address asset, uint256 amount, address to) public {
        pool.withdraw(asset, amount, to);
    }

    function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode, address onBehalfOf) public {
        pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
    }

    function _executeApproval(bytes memory data) internal {
        (bool success, bytes memory returnData) = address(daiAddress).call(data);
        require(success, "GoerliConnector: approval failed");
    }

    function _executeCall(bytes calldata data) internal{
        (bytes memory functionData, bool isSupply) = abi.decode(data, (bytes, bool));
        if(isSupply){
            _executeApproval(functionData);
            return;
        }
        (bool success, bytes memory returnData) = address(pool).call(data);
        require(success, "GoerliConnector: call failed");
    }
}