pragma solidity ^0.4.2;
import "./DappToken.sol";

contract DappTokenSale{
	address admin;
	DappToken public tokenContract;
	uint public tokenPrice;
	
	constructor(DappToken _tokenContract, uint256 _tokenPrice) public{
		// Assign an admin
		admin = msg.sender;

		// Token Contract
		tokenContract = _tokenContract;

		// Token Price
		tokenPrice = _tokenPrice;
	}
}