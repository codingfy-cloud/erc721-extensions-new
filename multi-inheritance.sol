contract owned {
    address payable owner;

    constructor() public {
        payable(msg.sender);
    }
    
}

contract mortal is owned() {
    bool mortal_alive;

    constructor() public {
        mortal_alive = true;    
    }

    function kill() virtual public {
        if (msg.sender == owner) {
            mortal_alive = false;
        }
    }
}

contract Base1 is mortal() {
    bool base1_alive;

    constructor() public {
        base1_alive = true;    
    }

    function kill() virtual override public {
        base1_alive = false;
        uint test;
        test = 3;
        super.kill();
    }
}


contract Base2 is mortal() {
    bool base2_alive;

    constructor() public {
        base2_alive = true;
    }

    function kill() virtual override public {
        base2_alive = false;
        super.kill();
    }
}

contract Final is Base1(), Base2() {
    bool final_alive;

    constructor() public {
        final_alive = true;    
    }

    function kill() public override (Base1, Base2) {
           final_alive = false;
         super.kill();
    }
}

contract _MAIN_ {
    mortal test;

    constructor () public {

        test = new Final();
        test.kill();
    }
}