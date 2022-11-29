contract Bank {
    uint a;
    uint b;

    function test() public {
        uint i;
        a = 5;

        i = 0;
        while(i < a) {
            i = i + 1;

            if(i == 3) {
                continue;
            }

            b = b + i;
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