contract _MAIN_ {
    uint8 a;

    uint8 c;


    constructor () public {
        c = a - 2;

        assert(c >= 0);
        assert(c < 256);
        assert(c == 254);
    }
}