pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";

/** @author Juan Castellon
    @title Token contract to be used in TrustReview Platform.
    @dev Token is a contract that extends OpenZeppelin audited token contracts
        and also has any Platform specific data. 
 */
contract TrustReviewToken is ERC20, ERC20Detailed {
    /** Constants */
    uint8 private constant NO_DECIMALS = 0;

    /** State variables */
    address private tokenFactory;
    address private company;

    /** Constructors */
    /** @dev Default constructor to create a token on the Platform. It uses 
            ERC20Detailed, ERC20 and Owned constructors to set state variables. 
        @param aCompany address of the company that requests this token creation.
        @param tokenName string with the name of the token.
        @param tokenSymbol string with a 3 chars (aprox) token symbol.
        @param initialSupply uint256 with initial total supply for this token.
    */
    constructor(
        address aCompany,
        string memory tokenName,
        string memory tokenSymbol,
        uint256 initialSupply
    ) 
        public 
        ERC20Detailed(tokenName, tokenSymbol, NO_DECIMALS)
        ERC20()
    {
        company = aCompany;
        _mint(msg.sender, initialSupply); // assigning all tokens to owner initially.
    }

}
