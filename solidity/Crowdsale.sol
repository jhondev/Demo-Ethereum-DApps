contract Crowdsale {
    function invest(address _beneficiary) public payable {} //#A
    function finalize() onlyOwner public {} //#B 
    function refund() public {} //#C
}

// #A This allows an investor to book crowdsale tokens; note no parameter is necessary to specify the amount of ether being invested, because ether is being sent through the msg.value property
// #B This allows the crowdsale organizer to release tokens to the investors, in case of successful completion, and grant a bonus to the development team, if applicable
// #C This allows an investor to get refunded in case of unsuccessful completion