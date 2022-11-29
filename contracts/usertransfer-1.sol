contract Bank {
    uint public a;
    uint public b;

    constructor () public {
        a = 3;
        b = 0;
    }
    function transfer(uint _a, uint _b) public returns(uint) {
        return _a + _b;
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        uint a = 0;
        uint b = 0;
        a = bank.a();
        assert(a==3);
        b = bank.transfer(a, 3);
        assert(b==3);
    }
}