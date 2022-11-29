contract Bank {

    function test() public payable {
        uint[2] memory array;

        array[0] = 1;
        array[1] = 2;

        uint[2] memory temp;
        temp = array;

        assert(temp[0] == 1);

        temp[0] = 7;

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