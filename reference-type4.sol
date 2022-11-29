contract Bank {
    uint[5] array;

    function test() public payable {
        array[0] = 10;

        uint[5] memory temp;
        temp = array;
        temp[0] = 7;

        assert(temp[0] == 7);
        assert(array[0] == 10);

    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}