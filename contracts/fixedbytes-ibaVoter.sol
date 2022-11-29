//ibaVoter
// pragma solidity ^0.4.8;

contract ibaVoter {
    
    struct Proposal{
        bytes32 name;
    }
    
    struct Ballot{
        bytes32 name;
        address chainperson;
        bool blind;
        bool finished;
    }
    
    struct votedData{
        uint256 proposal;
        bool isVal;
    }
    
    event Vote(
        address votedPerson,
        uint256 proposalIndex
        );
        
    event Finish(
        bool finished
        );

    mapping (address => mapping(uint256 => mapping(address => votedData))) votedDatas;
    mapping (address => mapping(uint256 => address[])) voted;
    mapping (address => mapping(uint256 => mapping(uint256 => uint256))) voteCount;
    mapping (address => Ballot[]) public ballots;   
    mapping (address => mapping(uint256 => Proposal[])) public proposals;
    
    function getBallotsNum(address chainperson) public view returns (uint count) {
        return ballots[chainperson].length; 
    }
    function getProposalsNum(address chainperson, uint ballot) public view returns (uint count) {
        return proposals[chainperson][ballot].length;
    }
    
    function getBallotIndex(address chainperson, bytes32 ballotName) public view returns (uint index){
        for (uint i=0;i<ballots[chainperson].length;i++){
            if (ballots[chainperson][i].name == ballotName){
                return i;
            }
        }
    }
    function isVoted(address chainperson, uint ballot) public view returns (bool result){
        for (uint8 i=0;i<voted[chainperson][ballot].length;i++){
            if (voted[chainperson][ballot][i] == msg.sender){
                return true;
            }
        }
        return false;
    }
    function startNewBallot(bytes32 ballotName, bool blindParam, bytes32[] calldata proposalNames) external returns (bool success){
        for (uint8 y=0;y<ballots[msg.sender].length;y++){
            if (ballots[msg.sender][y].name == ballotName){
                revert();
            }
        }
        ballots[msg.sender].push(Ballot({
            name: ballotName, 
            chainperson: msg.sender, 
            blind: blindParam,
            finished: false
        }));
        
        uint ballotsNum = ballots[msg.sender].length;
        for (uint8 i=0;i<proposalNames.length;i++){
            proposals[msg.sender][ballotsNum-1].push(Proposal({name:proposalNames[i]}));
        }
        return true;
    }
    
    function getVoted(address chainperson, uint256 ballot) public view returns (address[] memory){
        if (ballots[chainperson][ballot].blind == true){
            revert();
        }
        return voted[chainperson][ballot];
    }
    
    function getVotesCount(address chainperson, uint256 ballot, bytes32 proposalName) public view returns (uint256 count){
        if (ballots[chainperson][ballot].blind == true){
            revert();
        }
        
        for (uint8 i=0;i<proposals[chainperson][ballot].length;i++){
            if (proposals[chainperson][ballot][i].name == proposalName){
                return voteCount[chainperson][ballot][i];
            }
        }
    }
    
    function getVotedData(address chainperson, uint256 ballot, address voter) public view returns (uint256 proposalNum){
        if (ballots[chainperson][ballot].blind == true){
            revert();
        }
        
        if (votedDatas[chainperson][ballot][voter].isVal == true){
            return votedDatas[chainperson][ballot][voter].proposal;
        }
    }
    
    /*Voting function*/
    function vote(address chainperson, uint256 ballot, uint256 proposalNum) external returns (bool success){
        
        if (ballots[chainperson][ballot].finished == true){
            revert();
        }
        for (uint8 i = 0;i<voted[chainperson][ballot].length;i++){
            if (votedDatas[chainperson][ballot][msg.sender].isVal == true){
                revert();
            }
        }
        voted[chainperson][ballot].push(msg.sender);
        voteCount[chainperson][ballot][proposalNum]++;
        // voteCount[chainperson][ballot][proposalNum] = voteCount[chainperson][ballot][proposalNum] + 1;
        votedDatas[chainperson][ballot][msg.sender] = votedData({proposal: proposalNum, isVal: true});
        emit Vote(msg.sender, proposalNum);
        return true;
    }
    
    function getProposalIndex(address chainperson, uint256 ballot, bytes32 proposalName) public view returns (uint index){
        for (uint8 i=0;i<proposals[chainperson][ballot].length;i++){
            if (proposals[chainperson][ballot][i].name == proposalName){
                return i;
            }
        }
    }
    
    
    function finishBallot(bytes32 ballot) external returns (bool success){
        for (uint8 i=0;i<ballots[msg.sender].length;i++){
            if (ballots[msg.sender][i].name == ballot) {
                if (ballots[msg.sender][i].chainperson == msg.sender){
                    ballots[msg.sender][i].finished = true;
                    emit Finish(true);
                    return true;
                } else {
                    return false;
                }
            }
        }
    }
    
    /*Result function*/
    function getWinner(address chainperson, uint ballotIndex) public view returns (bytes32 winnerName){
            if (ballots[chainperson][ballotIndex].finished == false){
                revert();
            }
            uint256 maxVotes;
            bytes32 winner;
            for (uint8 i=0;i<proposals[chainperson][ballotIndex].length;i++){
                if (voteCount[chainperson][ballotIndex][i]>maxVotes){
                    maxVotes = voteCount[chainperson][ballotIndex][i];
                    winner = proposals[chainperson][ballotIndex][i].name;
                }
            }
            return winner;
    }
}

contract _MAIN_ {
    ibaVoter voterContract;
    address addr;
    constructor () public {
        voterContract = new ibaVoter();
        addr = address(voterContract);
        assert(addr == address(voterContract));
        bytes32 ballotName = "BallotTest";
        bool blindParam = false;
        bytes32[] memory proposalNames;
        proposalNames = new bytes32[](4);
        // proposalNames.length = 3;
        proposalNames[0] =  "A";
        proposalNames[1] =  "B";
        proposalNames[2] =  "C";
        voterContract.startNewBallot(ballotName, blindParam, proposalNames);
        voterContract.vote(msg.sender, 0, 1);
    }
}
