contract Bank {

    function add(uint x, uint y) public returns (uint r){
        uint $temp;

        r = x + y;

        assert(r >= 0);

        return r;
    }
}

contract _MAIN_ {
    Bank bank;

    uint $a;
    uint $b;
    uint c;


    constructor () public {
        bank = new Bank();

        c = bank.add($a, $b);

        assert(c == $a + $b);
        assert(c >= 0);
    }
}