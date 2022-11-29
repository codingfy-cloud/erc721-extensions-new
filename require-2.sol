contract Bank {

    uint public totalSupply;

    constructor() public {
        totalSupply = 100;
    }

    function test(uint x, uint y) public returns (bool r) {

        if (x > y) {
            r = true;
        } else {
            r = false;
        }

        require(x > y);
        r = true;
    }
}

contract _MAIN_ {
    Bank bank;

    uint $a;
    uint $b;
    bool res;

    constructor () public {
        bank = new Bank();
        res = bank.test($a, $b);
    }
}
