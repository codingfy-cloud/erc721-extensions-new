contract Bank {
   mapping(uint=>uint) balances;

   function deposit(uint key, uint amount) public payable {
     balances[key] += amount;
   }

   function withdraw(uint key, uint amount) public {
      //if( balances[key] >= amount) {
        balances[key] = balances[key] - amount;
      //}
   }

    function test() public payable {
        uint originalBalance = balances[1];

        deposit(1, 10);
        withdraw(1, 10);

        assert(balances[1] == originalBalance);

        mapping(uint => uint) storage test = balances;      // "test" is actually a reference to "balances"

        assert(balances[1] == originalBalance);
        assert(test[1] == originalBalance);

        test[1] = 1;        // this should make balances[1] := 1
        test[2] = 2;        // this should make balances[2] := 2

        assert(test[1] + test[2] == 3);

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