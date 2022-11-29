contract ModifierTest {
    uint public modState1;
    uint public modState2;
    uint public modState3;

    uint value;

    constructor (uint v) public {
        value = v;
    }

    modifier modA() {
        modState1 = modState1 + 1;
        _;
        modState1 = modState1 + 1;
        _;
    }

    modifier modB() {
        modState2 = modState2 + 1;
        _;
        modState2 = modState2 + 1;
        _;
    }

    
}

contract ModifierTest2 is ModifierTest {

    constructor () public modA modB ModifierTest(10) {
        modState3 = modState3 + 1;
    }
}

contract _MAIN_ {
    ModifierTest mt;

    constructor () public {

        mt = new ModifierTest2();
    }
}