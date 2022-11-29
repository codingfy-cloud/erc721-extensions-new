contract Bank {
    uint $a;
    uint $b;
    uint c;
    uint d;

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

    function test() public {
        require($a >= 0, "NEGATIVE_VALUE");
        require($b > 0, "NEGATIVE_VALUE");

        (c, d) = add($a, $b);

        assert(c + d > c);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}