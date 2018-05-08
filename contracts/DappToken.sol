pragma solidity ^0.4.2;

contract DappToken{
	uint256 public totalSupply;
	// 	Name
	string public name = "Marty Token";
	//	Symbol
	string public symbol = "Mrty";
	//	Standard
	string public standard = "Marty Token v1.0";

	//mapping(key, value)
	mapping(address => uint256) public balanceOf;

	constructor(uint _initialSupply) public{
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;
	}
}