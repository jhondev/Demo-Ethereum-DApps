pragma solidity ^0.4.24;

contract SimpleCoin1 { //#B

    mapping(address => uint256) public coinBalance; //#C

    constructor() { //#D

        coinBalance[0x14723a09acff6d2a60dcdf7aa4aff308fddc160c] = 10000; //#E
    }

    function transfer(address _to, uint256 _amount) { //#F
        coinBalance[msg.sender] -= _amount; //#G 
        coinBalance[_to] += _amount; //#H
    }
}