contract _MAIN_ {
    uint counter;

    function increase(uint a) public returns (uint){
        counter += a;
        return counter;
    }

    constructor () public {
        counter = 0;
        uint a;

        a = increase(increase(2));

        assert( a == 4 ); // this assertion must be satisfied.
        // or assert( counter == 4);
    }
}