contract _MAIN_ {
    uint $a;
    uint $b;
    uint c;


    constructor () public {
        c = $a + $b;

        assert(c >= 0);
        assert(c <= 115792089237316195423570985008687907853269984665640564039457584007913129639935);
        assert(c == $a + $b);
    }
}