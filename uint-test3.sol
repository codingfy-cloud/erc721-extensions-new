contract _MAIN_ {
    uint8 a;
    uint8 b;
    uint8 c;


    constructor () public {
        a = 255;
        b = 255;
        c = a + b;

        assert(c >= 0);
        assert(c == 254);
        assert(c == a + b);
    }
}