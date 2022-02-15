// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20VotesComp.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";


contract FateOfSagaToken is ERC20, ERC20Burnable, Pausable, ERC20Permit, ERC20VotesComp, AccessControlEnumerable {
    bytes32 public constant CEO_CTO_ROLE = keccak256("CEO_CTO_ROLE");
    constructor()
        ERC20("Fate of Saga Token", "FOFS")
        ERC20Permit("Fate of Saga Token")

    {
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _mint(getRoleMember(DEFAULT_ADMIN_ROLE, 0), 250000000 * 10 ** decimals());
    }

    function burn_InPool_byCEOorCTO (uint256 _amount) external onlyRole(CEO_CTO_ROLE){
        _burn(getRoleMember(DEFAULT_ADMIN_ROLE, 0), _amount);
    }

    function pause_byCEOorCTO() public onlyRole(CEO_CTO_ROLE) {
        _pause();
    }

    function unpause_byCEOorCTO() public onlyRole(CEO_CTO_ROLE) {
        _unpause();
    }


    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }

}
