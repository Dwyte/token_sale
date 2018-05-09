pragma solidity ^0.4.2;
import "./DappToken.sol";

contract DappTokenSale{
	address admin;
	DappToken public tokenContract;
	uint public tokenPrice;
	uint public tokenSold;

	event Sell(address _buyer, uint _amount);
	
	constructor(DappToken _tokenContract, uint256 _tokenPrice) public{
		admin = msg.sender;
		tokenContract = _tokenContract;
		tokenPrice = _tokenPrice;
	}

	// multiply
	function multiply(uint x, uint y) internal pure returns(uint z){
		require(y == 0 || (z = x * y) / y == x);
	}


	// Buy Tokens
	function buyTokens(uint256 _numberOfTokens) public payable{
		// Require the value is equal to tokens
		require(msg.value == multiply(_numberOfTokens, tokenPrice));

		// Require that the contract has enough tokens
		require(tokenContract.balanceOf(this) >= _numberOfTokens);

		// Require that a transfer is successful
		require(tokenContract.transfer(msg.sender, _numberOfTokens));

		// Keep track of number token sold
		tokenSold += _numberOfTokens;

		// emit a sell event
		Sell(msg.sender, _numberOfTokens);
	}

}