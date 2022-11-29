contract Test {

    function getLength() public returns (uint length) {
        uint a = 1;
        a = (a + 2) * 2;

        assert(a == 6);

        length = a;

        return length;
    }

}

contract _MAIN_ {
    Test test;

    constructor () public {
        test = new Test();

        uint b;
        b = test.getLength();

        assert(b == 6);
    }
}