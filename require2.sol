
contract Bank {
    bool entered = false;
    uint[5] a;

    function withdraw(uint amount) public returns (uint r){
        require(a[0] >= amount, "INSUFFICIENT_VALUE");
        a[0] -= amount;
        transfer(amount);
        return r;
    }

    function transfer(uint amt) public returns (uint r){
        require(!entered);
        entered = true;
        withdraw(amt);
    }

    function test() public {
        //__assume__(a[0] > 200);
        a[0] = 250;

        entered = false;
        withdraw(100);
    }
}

contract _MAIN_ {
    Bank bank;

    constructor () public {
        bank = new Bank();
        bank.test();
    }
}