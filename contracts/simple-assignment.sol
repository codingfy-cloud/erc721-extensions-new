contract Bank {
    uint a;
    uint b;

    function test() public {
        a = a + 2;

        if(a > b) {
            a = a + 5;
        }
        else {
            a = a + b;
        }
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}