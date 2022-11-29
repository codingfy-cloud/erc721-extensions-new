contract Ownable {
    address internal _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        _transferOwnership(msg.sender);
    }

    function owner() public view returns (address currentOwner) {
        return _owner;
    }

    modifier onlyOwner() {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        address oldOwner = _owner;
        //oldOwner = _owner;
        _owner = newOwner;
        // emit OwnershipTransferred(oldOwner, newOwner);
    }
}

contract ERC20 {
    // uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    string public name;                   //fancy name: eg Simon Bucks
    uint8 public decimals;                //How many decimals to show.
    string public symbol;                 //An identifier: eg SBX

    event  Approval(address indexed src, address indexed guy, uint wad);
    event  Transfer(address indexed src, address indexed dst, uint wad);

    constructor(string memory _tokenName, uint8 _decimalUnits, string  memory _tokenSymbol) public {
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value, "token balance is lower than the value requested");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value, "token balance or allowance is lower than amount requested");
        balances[_to] += _value;
        balances[_from] -= _value;
        // if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        // }
        emit Transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
}

contract Token is Ownable, ERC20 {
    event  Deposit(address indexed dst, uint wad);
    event  Withdrawal(address indexed src, uint wad);

    uint256 public totalSupply;

    constructor (string memory _name, string memory _symbol, uint8 _decimals)
        Ownable() ERC20(_name, _decimals, _symbol) public payable {
            deposit();
        }

    fallback() external payable {
        deposit();
    }

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    function withdraw(uint wad) public {
        require(balances[msg.sender] >= wad);
        balances[msg.sender] -= wad;
        totalSupply -= wad;

        msg.sender.call{value:wad};
        emit Withdrawal(msg.sender, wad);
    }

    function getTotalSupply() public view returns (uint _totalSupply) {
        return address(this).balance;
    }

    function recover() public onlyOwner {
        _owner.call{value: address(this).balance};
    }
}

contract _MAIN_ {
    Token token;

    constructor () public {
        token = new Token("TestToken", "TT", 8);

        // assert(b == 2);
    }
}
