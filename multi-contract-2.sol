contract Producer {
    Consumer consumer;
    uint id;
    uint itemCount;

    constructor(Consumer cons) public {
        consumer = cons;
        itemCount = 0;
    }

    function produceInt() public returns (uint item) {
        return ++itemCount;
    }

    function getID() public returns (uint idNum) {
        return id;
    }

    function getID(uint d) public returns (uint _id) {
        return getID();
    }

    function getID(uint d, uint e) public returns (uint _id) {
        return getID();
    }
}

contract Consumer {
    uint id;
    Producer producer;

    constructor() public {

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

    function getID(uint a) public returns (uint _id) {
        return id;
    }
}


contract _MAIN_ {

    constructor() public {
        Consumer consumer;
        Producer producer;

        consumer = new Consumer();
        producer = new Producer(consumer);

        consumer.setProducer(producer);
    }
}