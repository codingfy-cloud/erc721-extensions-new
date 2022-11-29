contract Test {
    uint a;
    uint b;
    uint c;

    function test() public {
        (a,b,c) = (1,2,3);
        (a,b,c) = (a + 1, b + 1, c + 1);

        assert(a == 2);
        assert(b == 3);
        assert(c == 4);
    }

}

contract _MAIN_ {
    Test test;

    constructor () public {
        test = new Test();
        test.test();
    }
}