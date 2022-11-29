contract Bank {
    uint[5] a;
    uint b;

    struct Happy {
        uint cc;
        uint dd;
    }

    struct Mary {
        uint tt;
        Happy hh;
    }

    function test() public {
        Happy memory happy;
        happy.cc = 1;
        happy.dd = 2;

        Mary memory mary;
        mary.tt = 3;
        mary.hh = happy;

        mary.hh.cc = 7;
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}