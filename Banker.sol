pragma solidity 0.4.19;
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

    // Масив позичальників
    mapping(address => Borrower) public borrowers;
//    Proposal[] proposals;
    //uint CUrr
    
    event Error(string message);
    event ShowBorrowerCredit(uint Amount);

    // Перевірка чи ще не позичав і {чи позика не перевищує доступний обєм кредитування}  
    function CanOpenCredit(address Borrower) public returns(bool) {
      if borrowers[Borrower] > 0 
      {
          Error('Already borrowed! Return previous credit first!');
          return false;
      }
      return true;
    }
    
    // Відкриття позики
    function OpenCredit({address Borrower} uint Amount) {
        if CanOpenCredit(msg.sender) {
           borrowers[msg.sender] = Amount; 
        }
    }
    
    // Перевірка кредиту по певному позичальнику
    function CheckBorrowerCredit(address Borrower) {
       ShowBorrowerCredit(borrowers[msg.sender]);   
    }
    
    // Закриття кредиту
    function CloseCredit(address Borrower; uint Amount)
    {
    //???    if msg.sender = contract.owner
      // Перевірка щоб хтось інший не закрив кредит
      
      // Перевірка суми
      borrowers[msg.sender] -= min(Amount, borrowers[msg.sender]);
    }
    

    /// Create a new ballot with $(_numProposals) different proposals.
//    function Ballot(uint8 _numProposals) public {
//        chairperson = msg.sender;
//        voters[chairperson].weight = 1;
//        proposals.length = _numProposals;
//    }

}