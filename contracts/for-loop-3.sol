contract Bank {
    uint a;
    uint b;

    constructor () public {
        a = 5;
        b = 0;

        for(uint i = 0; i < a; i++){
            if(i == 3) {
                break;
            }

            for(uint j = 0; j < i; j++){
                if(j == 2) {
                    continue;
                }

                b = b + i + j;
            }
        }

        b = b + a;

        assert(b == 11);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
    }
}