contract Bank {
   mapping(uint=>uint) balances;

   function deposit(uint key, uint amount) public payable {
     balances[key] += amount;
   }


   function withdraw(uint key, uint amount) public {
        balances[key] = balances[key] - amount;
   }

    function test() public payable {
        uint originalBalance = balances[1];

        deposit(1, 10);

        mapping(uint => uint) storage test = balances;      // "test" is actually a reference to "balances"

        assert(test[1] == originalBalance + 10);

        test[1] = 1;        // this should make balances[1] := 1

        assert(balances[1] == 1);       // this assertion should be satisfied
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}