pragma solidity ^0.4.24;


contract SimpleCoin2 { //#B

    mapping(address => uint256) public coinBalance; //#C
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(uint256 _initialSupply) { //#D
        coinBalance[msg.sender] = _initialSupply;
    }

    function transfer(address _to, uint256 _amount) {
        require(coinBalance[msg.sender] >= _amount);
        require(coinBalance[_to] + _amount >= coinBalance[_to]);
        coinBalance[msg.sender] -= _amount;
        coinBalance[_to] += _amount;
        Transfer(msg.sender, _to, _amount);
    }
}