contract Producer {
    Consumer consumer;
    uint idd;
    uint itemCount;

    constructor() public {
        itemCount = 0;
    }

    function produceInt() public returns (uint item) {
        return ++itemCount;
    }

    function setID(uint idNum) public {
        idd = idNum;
    }

    function getID() public returns (uint idNum) {
        return idd;
    }

    function getID(uint d) public returns (uint _id) {
        _id = getID();
        return _id;
    }
}

contract Consumer {
    uint id;
    Producer producer;

    constructor(uint idNum) public {
        producer = new Producer();
        id = idNum;
    }

    function setProducer(Producer prod) public payable {
        producer = prod;
    }

    function getProducer() public returns (Producer r) {
        return producer;
    }

    fallback() external payable {

    }

    function getID() public returns (uint _id) {
        return id;
    }

    function setProducerID(uint pid) public {
        producer.setID(pid);
    }

    function ttt(uint t) private {
        uint c;
    }

}


contract _MAIN_ {

    constructor() public {
        Consumer consumer;
        Producer producer;

        consumer = new Consumer(7);
        producer = consumer.getProducer();
        consumer.setProducerID(10);

        uint pid;
        pid = producer.getID(3);

        assert(pid == 10);
    }
}