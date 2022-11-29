contract _MAIN_ {
    uint counter;

    function increase(uint a) public returns (uint){
        counter += a;
        return counter;
    }

    constructor () public {
        counter = 0;
        uint a;

        a = increase(2);

        assert( a == 2 ); // this assertion must be satisfied.
        // or assert( counter == 2);
    }
}