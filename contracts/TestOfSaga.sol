// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./RoleControle.sol";

contract FateOfSaga is ERC20,ERC20Burnable, Pausable, RoleControle {

    address public First_CEO_Address = 0xCFE6dcd3A7Be85bd3256a9f8DeE134b3c515F3C1;

    constructor() 
        ERC20("Fate of Saga Token", "FOFS")
        RoleControle (
            First_CEO_Address)
            {
        _mint(msg.sender, 250000000 * 10 ** decimals());
    }

    function pause1() public onlyCEO {
        _pause();
    }

    function unpause1() public onlyCEO {
        _unpause();
    }

        function pause2() public onlyCTO {
        _pause();
    }

    function unpause2() public onlyCTO {
        _unpause();
    }


    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
    

    function _burn(address account, uint256 amount)
    internal
    override(ERC20)
    {   
        require(amount != 0, "burn amount exceeds value");
        super._burn(account, amount);
    }

    function burn1( uint _amount) external onlyCEO {
        _burn(owner(), _amount);
    }

    function burn2( uint _amount) external onlyCTO {
        _burn(owner(), _amount);
    }
}