pragma solidity ^0.4.2;

contract DappToken{
	// constructor
	// set the token
	// read the total number of token

	uint256 public totalSupply;

	constructor() public{
		totalSupply = 1000000; //state variable, like a class variable
	}
}