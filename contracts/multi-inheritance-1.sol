
contract object {
    uint num = 0;
    uint cons_step_object;

    constructor() public {
        num++;
        cons_step_object = num;
    }

    function go() public pure virtual returns (uint out) {
        out = 1;
    }
}

contract A is object {
    uint cons_step_A;

    constructor() public {
        num++;
        cons_step_A = num;
    }

    function go() public pure override virtual returns (uint out) {
        out = 1;
    }
}
contract B is object {
    uint cons_step_B;

    constructor() public {
        num++;
        cons_step_B = num;
    }

    function go() public pure override virtual returns (uint out) {
        out = 2;
    }
}

contract C is object {
    uint cons_step_C;

    constructor() public {
        num++;
        cons_step_C = num;
    }

    function go() public pure override virtual returns (uint out) {
        out = 3;
    }
}

// returns 2 as expected
contract AB is A, B {
    uint cons_step_AB;

    constructor() public {
        num++;
        cons_step_AB = num;
    }

    function go()  public override(A,B) virtual  pure returns (uint out){
       out = super.go();
    }
}

// returns 1 as expected
contract BA is B, A {
    uint cons_step_BA;

    constructor() public {
        num++;
        cons_step_BA = num;
    }

    function go() public override(B,A) virtual pure returns (uint out) {
       out = super.go();
    }
}

// returns 3 as expected
contract AC is A, C {
    uint cons_step_AC;

    constructor() public {
        num++;
        cons_step_AC = num;
    }

    function go() public override(A,C) virtual pure returns (uint out) {
       out = super.go();
    }
}


contract AC_AB is AC, AB {
    uint cons_step_AC_AB;

    constructor() public {
        num++;
        cons_step_AC_AB = num;
    }

    function go() public override(AC,AB) virtual pure returns (uint out) {
       out = super.go();
    }
}

// compiles, returns 3, why???
contract AC_BA is AC, BA {
    uint cons_step_AC_BA;

    constructor() public {
        num++;
        cons_step_AC_BA = num;
    }

    function go() public override(AC,BA) virtual pure returns (uint out) {
       out = super.go();
    }

    function checkValue() public {
        assert(cons_step_object == 1);
        assert(cons_step_B == 2);
        assert(cons_step_A == 3);
        assert(cons_step_C == 4);
        assert(cons_step_AC == 5);
        assert(cons_step_BA == 6);

        assert(cons_step_AC_BA == 7);
    }
}

contract _MAIN_ {
    AC_BA test;
    uint result;

    constructor () public {

        test = new AC_BA();
        test.checkValue();

        result = test.go();
        assert(result == 3);
    }
}