contract Person {
    uint internal age;
    bool locked;

    constructor (uint ag) public {
        age = ag;
    }

    modifier postiveBalance(uint amount) {
        require(address(this).balance >= amount);
        _;
    }

    function getAge() public returns (uint r) {
        return age;
    }
}

contract Parent is Person { 
    uint internal sum;

    constructor (uint amt) public Person(amt) {
        sum = amt;
    }


    function setValue(uint a, uint b) external { 
        sum += a + b;
    }

    function getValue() virtual external view returns(uint r) { 
        return sum; 
    } 
} 

contract Child is Parent { 
    uint internal value;

    constructor (uint amt) public Parent(amt) postiveBalance(0) {
        value = amt;
    }

    function getValue() override external view returns(uint r) { 
        return value + sum; 
    } 
} 

contract _MAIN_ {
    Parent cc;
    uint result;

    constructor () public {

        cc = new Child(200);

        cc.setValue(10, 20);
        result = cc.getValue();

        assert(result == 430);

        uint age;

        age = cc.getAge();

        assert(age == 200);
    }
}
