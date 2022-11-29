contract Bank {

    function add(uint x, uint y) public returns (uint r, uint s){

        assert(msg.sender != address(0));
        assert(msg.sender == address(1));

        return (x,y);
    }
}


contract _MAIN_ {
    Bank bank;
    uint $a;
    uint $b;
    uint c;
    uint d;

    constructor () public {
        bank = new Bank();
        (c, d) = bank.add($a, $b);

        assert(c == $a);
    }
}