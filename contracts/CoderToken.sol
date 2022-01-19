// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract CoderToken is ERC20 {

    uint256 public INITIAL_SUPPLY = 42000000;
    
    constructor() ERC20("CoderToken", "CDT") {
        decimals();
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
        
}
