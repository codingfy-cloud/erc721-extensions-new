contract Bank {
    uint[5] a;
    uint b;

    struct Happy {
        uint cc;
        uint dd;
    }

    Happy gg;

    function test() public {
        Happy memory happy;
        happy.cc = 1;
        happy.dd = 2;

        assert(happy.cc + happy.dd == 3);

        gg.cc = happy.cc;
        gg.dd = 4;
    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}