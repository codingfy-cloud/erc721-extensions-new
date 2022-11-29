contract Bank {
    uint a;
    uint b;

    function test() public {
        uint i;
        a = 2;

        i = 0;
        while(i < a) {
            b = b + i;
            i = i + 1;
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