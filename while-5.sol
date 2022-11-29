contract Bank {
    uint a;
    uint b;
    uint c;

    function test() public {
        uint i;
        a = 5;
        b = 0;
        uint c;
        c = 10;

        i = 0;
        while(i < a) {
            uint c;
            c = i;

            if(i == 3) {
                break;
            }

            b = b + i;
            i = i + 1;

            c = c + b;
        }

        assert(b == 3);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}