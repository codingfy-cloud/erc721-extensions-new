contract Consumer {
   uint public wallet;

   constructor(uint value) public {
       wallet = value;
   }

   function setWallet(uint value) public payable {
       wallet = value;
   }

   function getWallet() public returns (uint r) {
       return wallet;
   }

   fallback() external payable {

   }
}

contract _MAIN_ {
    Consumer consumer;
    uint x;
    uint y;

    constructor() public {
        consumer = new Consumer(2);
        x = 2;
        y = 5;

        uint result;
        uint wallet;
        wallet = consumer.getWallet();
        result = test(wallet, y);

        assert(result == 7);

        consumer.setWallet(result + y);
        result = consumer.getWallet();

        assert(result == 12);
    }

    function test(uint a, uint b) public returns (uint r){
        return a + b;
    }
}