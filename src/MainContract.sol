pragma solidity 0.8.19;

contract MainContract {
    function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external {
        // pool.supply(asset, amount, onBehalfOf, referralCode);
        bytes memory approvalData = abi.encodeWithSignature("approve(address,uint256)", asset, amount);
        bytes memory data = abi.encodeWithSignature("supply(address,uint256,address,uint16)", asset, amount, onBehalfOf, referralCode);
    }

    function withdraw(address asset, uint256 amount, address to) external {
        // pool.withdraw(asset, amount, to);
        bytes memory data = abi.encodeWithSignature("withdraw(address,uint256,address)", asset, amount, to);
    }

    function borrow(address asset, uint256 amount, uint256 interestRateMode, uint16 referralCode, address onBehalfOf) external {
        // pool.borrow(asset, amount, interestRateMode, referralCode, onBehalfOf);
        bytes memory data = abi.encodeWithSignature("borrow(address,uint256,uint256,uint16,address)", asset, amount, interestRateMode, referralCode, onBehalfOf);
    }

    function repay(address asset, uint256 amount, uint256 rateMode, address onBehalfOf) external {
        // pool.repay(asset, amount, rateMode, onBehalfOf);
        bytes memory data = abi.encodeWithSignature("repay(address,uint256,uint256,address)", asset, amount, rateMode, onBehalfOf);
    } 
}