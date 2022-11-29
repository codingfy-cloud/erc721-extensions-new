contract Bank {
    uint a;
    uint b;

    function test() public {
        uint i;
        uint j;

        a = 4;
        b = 0;

        i = 0;
        while(i < a) {
            i = i + 1;

            j = 0;
            while(j < i) {
                j = j + 1;
                b = b + i + j;
            }
        }

        b = b + a;

        assert(b == 54);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}