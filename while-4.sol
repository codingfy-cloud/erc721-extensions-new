contract Bank {
    uint a;
    uint b;

    function test() public {
        uint i;
        a = 7;

        i = 0;
        while(i < a) {
            i = i + 1;

            if(i == 3) {
                continue;
            }

            if(i == 6) {
                break;
            }

            b = b + i;
        }

        b = b + a;
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}