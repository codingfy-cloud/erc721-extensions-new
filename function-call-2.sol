contract Bank {

    function add(uint x, uint y) public returns (uint r, uint s){

        if(x > y) {
            r = x + y;
            s = x * y;
        }
        else {
            r = x + 3;
            s = y + 3;
        }

        return (r,s);
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

        (c, d) = bank.add(a, b);

        assert(c == a + b || c == a + 3);
    }
}