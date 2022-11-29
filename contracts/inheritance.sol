contract Parent{ 
    uint internal sum; 

    function setValue(uint a, uint b) external { 
        sum = a + b;
    }

    function getSum() public returns (uint r) {
        return sum;
    }
} 

contract Child is Parent {

    function getValue() external view returns(uint r) { 
        return sum; 
    } 
} 

contract _MAIN_ {
    Child cc;
    Parent pp;
    uint result;

    constructor () public {
        cc = new Child();

        cc.setValue(10, 20);
        result = cc.getValue();

        assert(result == 30);

        pp = new Parent();
        pp.setValue(result, result);

        result = pp.getSum();

        assert(result == 60);

    }
}
