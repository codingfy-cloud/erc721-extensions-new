contract Bank {
    uint[] array;

    function test() public payable {
        array.push(10);

        assert(array[0] == 10);

        uint[] storage temp = array;
        temp[0] = 7;

        assert(temp[0] == 7);
        assert(array[0] == 7);

    }

}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}