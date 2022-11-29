contract Token {
   mapping(address => uint) public balances;

   function setBalance(address user, uint value) public {
       balances[user] = value;
   }

   function getBalance(address user) public returns (uint b) {
       return balances[user];
   }
}

contract Pool {
    address tokenAddr;
    constructor(address _tokenAddr) public {
        tokenAddr = _tokenAddr;
    }

   function getPoolBalance() public returns (uint r) {
       uint bal;
       bal = Token(tokenAddr).getBalance(address(this));
   }
}

contract _MAIN_ {
    Token token;
    Pool pool;

    constructor() public {
        token = new Token();
        pool = new Pool(address(token));

        token.setBalance(address(pool), 100);

        uint tokenBal;
        uint poolBal;

        tokenBal = token.getBalance(address(pool));
        assert(tokenBal == 100);

        poolBal = pool.getPoolBalance();
        assert(poolBal == 100);
    }
}