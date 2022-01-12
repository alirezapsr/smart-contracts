//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

contract VoteProject {
   
    
    struct Voter {
        
        uint weight;
        bool voted;
        uint8 vote;
    }
    
    
    struct Proposal {
        
        uint voteCount;
    }
    
    
    enum Stage { Init, Reg, Vote, Done }
    Stage public stage = Stage.Init;
    
    
    address chairPerson;
    mapping(address => Voter) Voters;
    Proposal[] proposals;
    
    uint startTime;
    
    
    modifier validStage (Stage requiredStage) {
	
        require(stage == requiredStage);
        _;
    }
    
    event votingCompleted();
    
    
    constructor (uint8 _numProposals) public {
        
        chairPerson = msg.sender;
        Voters[chairPerson].weight = 2;
        
        stage = Stage.Reg;
        startTime = block.timestamp;
    }
    
    
    function register (address toVoter) public validStage(Stage.Reg) {
        
        if(msg.sender != chairPerson || Voters[toVoter].voted)
            return;
        
        Voters[toVoter].weight = 1;
        Voters[toVoter].voted = false;
        
        if( block.timestamp > ( startTime + 20 seconds ) ) {
            stage = Stage.Vote;
        }
    }
    
    
    function vote(uint8 toProposal) public validStage(Stage.Vote) {
        
        Voter storage sender = Voters[msg.sender];
        
        if(sender.voted || toProposal >= proposals.length)
            return;
            
        sender.voted = true;
        sender.vote = toProposal;
        
        proposals[toProposal].voteCount += sender.weight;
        
        if( block.timestamp > (startTime + 20 seconds) ) {
		
            stage = Stage.Done;
            emit votingCompleted();
        }
    }
    
    
    function winningProposal() public validStage(Stage.Done) view returns (uint8 _winningProposal) {
        
        uint256 winningVoteCount = 0;
        
        for(uint8 prop = 0; prop < proposals.length; prop++) {
            
            if(proposals[prop].voteCount > winningVoteCount) {
            
                winningVoteCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
        
        assert( winningVoteCount > 0 );
    }
}