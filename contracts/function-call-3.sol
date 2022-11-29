contract Bank {

    function add(uint x, uint y) public returns (uint r, uint s){
        uint t;
        uint p;

        t = x + y;
        p = x * y;

        return (t,p);
    }
}

contract _MAIN_ {
    Bank bank;

    uint a;
    uint b;
    uint c;
    uint d;

    constructor () public {
        bank = new Bank();

        (c,d) = bank.add(a, b);

        assert(c == a + b);
        assert(d == a * b);

        (a,b) = bank.add(c, d);
    }
}