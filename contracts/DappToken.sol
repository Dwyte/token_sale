pragma solidity ^0.4.2;

contract DappToken{
	uint256 public totalSupply;
	string public name = "Marty Token";
	string public symbol = "Mrty";
	string public standard = "Marty Token v1.0";


	event Transfer(
		address indexed _from,
		address indexed _to,
		uint256 _value
	);

	//approve
	event Approval(
		address indexed _owner, // I the owner
		address indexed _spender, // approved the spender
		uint256 _value	// to transfer x amount of tokens
	);


	mapping(address => uint256) public balanceOf;
	mapping(address => mapping(address => uint256)) public allowance;
	// allowance



	constructor(uint _initialSupply) public{
		balanceOf[msg.sender] = _initialSupply;
		totalSupply = _initialSupply;
	}

	// Transfer
	function transfer(address _to, uint256 _value) public returns(bool success){
		// Exception if account doesnt have enough
		require(balanceOf[msg.sender] >= _value);
		// Transfer the balance
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value;
		// Transfer Event

		emit Transfer(msg.sender, _to, _value);
		// Return a bool
		return true;
	}

	// Delegated Transfer

	// approve
	function approve(address _spender,uint256 _value) public returns(bool success){
		// Allowance
		allowance[msg.sender][_spender] = _value;  

		// Approve event
		emit Approval(msg.sender, _spender, _value);

		return true;
	}

	// transferFrom
	function transferFrom(address _from, address _to, uint256 _value) public returns(bool success){
		//require _from has enought token
		require(_value <= balanceOf[_from]);
		// require allowance is big enough
		require(_value <= allowance[_from][msg.sender]);
		//change abalnce
		balanceOf[_from] -= _value;
		balanceOf[_to] += _value;

		//update allowance
		allowance[_from][msg.sender] -= _value;



		//Transfer Event
		emit Transfer(_from, _to, _value);


		//return bool
		return true;
	}
}