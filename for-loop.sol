contract Bank {
    uint a;
    uint b;

    constructor () public {
        a = 3;
        b = 0;

        for(uint i = 0; i < a; i++){
            for(uint j = 0; j < i; j++){
                b = b + i + j;
            }
        }

        b = b + a;

        assert(b == 9);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
    }
}