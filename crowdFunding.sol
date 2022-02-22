//SPDX-license-Identifier: UNLICENSED
pragma solidity >=0.6.0 <0.9.0;

contract CrowdFunding {
    mapping(address=>uint) public contributors;
    address public manager;
    uint public minimumContribution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public noOfContributors;

    struct Request{
        string description;
        address payable;
        uint value;
        bool completed;
        uint noOfVoters;
        mapping(address=>bool) voters;
    }
    mapping(uint => Request) public request;
    uint public numRequest;

    constructor (uint _target,uint _deadline) public {
        target = _target;
        deadline = _deadline + block.timestamp;
        minimumContribution = 100 wei;
        manager = msg.sender;
    }

    function sendEth() public payable{
        require(block.timestamp < deadline, "Deadline has passed");
        require(msg.value >= minimumContribution, "Minimum Contribution is not met");
        if(contributors[msg.sender] == 0){
            noOfContributors +=1;
        }
        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function refund() public {
        require(block.timestamp>deadline && raisedAmount<target, "You are not eligible for refund");
        require(contributors[msg.sender]>0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;
    }
}