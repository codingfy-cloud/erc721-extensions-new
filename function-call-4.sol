contract Bank {

    function add(uint x, uint y) public returns (uint r, uint s){
        uint t;
        uint p;

        t = x + y;
        p = x * y;

        return (t,p);
    }

    function add(bool x, bool y) public returns (bool result) {
        return x && y;
    }
}


contract _MAIN_ {
    Bank bank;

    uint a;
    uint b;
    uint c;
    uint d;

    bool r1;
    bool r2;

    constructor () public {
        r1 = true;
        r2 = false;

        bank = new Bank();

        (c,d) = bank.add(a, b);

        assert(c == a + b);
        assert(d == a * b);

        (a,b) = bank.add(c, d);

        bool result;
        result = bank.add(r1, r2);

        assert(result == false);
    }
}