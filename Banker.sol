pragma solidity 0.4.19;

library Math {
  function max(uint a, uint b) public pure returns (uint) {
    if (a > b) return a;
    else return b;
  }
  function min(uint a, uint b) public pure returns (uint) {
    if (a < b) return a;
    else return b;
  }
}

contract Banker {

//    struct Voter {
//        uint weight;
//        bool voted;
//        uint8 vote;
//        address delegate;
//    }
//    struct Proposal {
//        uint voteCount;
//    }

//    address chairperson;

    // ����� ������������
    mapping(address => uint) public borrowers;
//    Proposal[] proposals;
    //uint CUrr
    
    event Error(string message);
    event ShowBorrowerCredit(uint Amount);

    // �������� �� �� �� ������� � {�� ������ �� �������� ��������� ��� ������������}  
    function CanOpenCredit(address Borrower) public returns(bool) {
      if (borrowers[Borrower] > 0) 
      {
          Error('Already borrowed! Return previous credit first!');
          return false;
      }
      return true;
    }
    
    // ³������� ������ ///{address Borrower}///
    function OpenCredit(uint Amount) public {
        if (CanOpenCredit(msg.sender))
        {
           borrowers[msg.sender] = Amount; 
        }
    }
    
    // �������� ������� �� ������� ������������
    function CheckBorrowerCredit(address Borrower) public {
       ShowBorrowerCredit(borrowers[Borrower]);   
    }
    
    // �������� �������
    function CloseCredit(address Borrower, uint Amount) public
    {
    //???    if msg.sender = contract.owner
      // �������� ��� ����� ����� �� ������ ������
      
      // �������� ����
      borrowers[Borrower] -= Math.min(Amount, borrowers[Borrower]);
    }
    

    /// Create a new ballot with $(_numProposals) different proposals.
//    function Ballot(uint8 _numProposals) public {
//        chairperson = msg.sender;
//        voters[chairperson].weight = 1;
//        proposals.length = _numProposals;
//    }

}