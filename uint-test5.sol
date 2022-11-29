contract _MAIN_ {
    uint8 a;
    uint8 b;
    uint8 c;
    uint8 d;


    constructor () public {
        a = 255;
        a++;
        b--;

        assert(a == 0);
        assert(b == 255);

        c = 1;
        --c;
        assert(c == 0);
        --c;
        assert(c == 255);

        c = 0;
        d = c--;
        assert(d == 255);
    }
}