contract A {
    uint public x;

    function setValue1(uint _x) virtual public {
        x = _x;
    }
    
    function getX() virtual public returns (uint r){
        return x;
    }
}

contract B is A {
    function setValue2(uint _x) public{
        x = _x; 
    }

    function getX() public override returns (uint r) {
        return x;
    }
}

contract _MAIN_ {
    B b;
    uint result;

    constructor () public {

        b = new B();            // b has two state variables x, namely, A.x and B.x

        b.setValue2(100);       // this function call sets B.x to 100

        result = b.getX();      // this function returns B.x

        assert(result == 100);

        b.setValue1(200);       // this function call sets A.x to 200

        result = b.getX();      // this function call returns B.x
                                // B.x is still 100

        assert(result == 200);  // this assertion will fail
    }
}
