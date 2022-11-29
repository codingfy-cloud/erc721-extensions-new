contract Bank {

    uint public totalSupply;

    constructor() public {
        totalSupply = 100;
    }

    function test(uint x, uint y) public returns (bool r) {
        totalSupply  = 90;

        if(x <= y) {
            revert("x is not greater than y!!");
        }

        r = true;
    }

    function getTotalSupply() public returns (uint) {
        return totalSupply;
    }
}

contract _MAIN_ {
    Bank bank;

    uint $a;
    uint $b;
    bool res;

    uint t = 0;

    constructor () public {
        bank = new Bank();

        res = bank.test($a, $b);
        t = bank.getTotalSupply();

        assert($a > $b || t == 100);    // check if $a <= $b, then t == 100
        assert($a <= $b || t == 90);    // check if $a > $b, then t == 90
    }
}
