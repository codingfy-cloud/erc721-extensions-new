contract Bank {
   mapping(address=>uint) balances;

   function deposit(uint amount) public payable {
     balances[msg.sender] += amount;
   }


   function withdraw(uint amount) public {
      if( balances[msg.sender] >= amount) {
        balances[msg.sender] = balances[msg.sender] - amount;
      }
   }

}

contract _MAIN_ {
    Bank bank;

    uint a;
    uint b;
    uint c;
    uint d;

    constructor () public {
        bank = new Bank();

        bank.deposit(10);

        bank.withdraw(10);
    }
}