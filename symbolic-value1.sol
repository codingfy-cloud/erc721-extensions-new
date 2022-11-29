contract Bank {

    function add(int x, int y) public returns (int r){
        int $temp;

        r = x + y;

        return r;
    }
}

contract _MAIN_ {
    Bank bank;

    int $a;
    int $b;
    int c;


    constructor () public {
        bank = new Bank();

        c = bank.add($a, $b);

        assert(c == $a + $b);
    }
}