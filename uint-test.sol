contract _MAIN_ {
    uint a;
    int b;


    constructor () public {
        a = 0;
        a = --a;

        b = -1;
        b = b - 2;

        assert(a >= 0);
        assert(a == 115792089237316195423570985008687907853269984665640564039457584007913129639935);

        assert(b == -3);
    }
}