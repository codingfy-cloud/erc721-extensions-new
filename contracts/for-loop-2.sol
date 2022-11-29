contract Bank {
    uint a;
    uint b;

    constructor () public {
        a = 5;
        b = 0;

        for(uint i = 0; i < a; i++){
            if(i == 2){
                continue;
            }

            b = b + i;
        }

        b = b + a;

        assert(b == 13);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
    }
}