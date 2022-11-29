contract Producer {
    Consumer consumer;
    uint id;
    uint itemCount;

    constructor(Consumer cons, uint _id) public {
        consumer = cons;
        id = _id;
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

    constructor(uint _id) public {
        id = _id;
    }

    function setProducer(Producer prod) public payable {
        producer = prod;

        uint pID;
        pID = producer.getID();

        assert(pID == 200);
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

        uint consumerID = 100;
        uint producerID = 200;

        consumer = new Consumer(consumerID);
        producer = new Producer(consumer, producerID);

        consumer.setProducer(producer);

        uint result;
        
        result = consumer.getID();

        assert(result == consumerID);
    }
}