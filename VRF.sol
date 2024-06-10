pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

contract ChainlinkVRF is VRFConsumerBaseV2 {

    VRFCoordinatorV2Interface COORDINATOR;
    address vrfCoordinatorAddr = 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625;
    bytes32 keyHash = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;

    uint64 s_subId;
    uint16 requestConfirmations = 3;
    uint32 callbackGasLimit = 200_000;
    uint32 numWords = 5;
    address owner;

    uint256[]  public s_randomWords;
    uint256 public requestId;

    constructor(uint64 subId) VRFConsumerBaseV2(vrfCoordinatorAddr) {
        COORDINATOR = VRFCoordinatorV2Interface(vrfCoordinatorAddr);
        s_subId = subId;
        owner = msg.sender;
    }

    function requestRandomWords() external {
        require(msg.sender == owner);
        requestId = COORDINATOR.requestRandomWords(
                keyHash,
                s_subId,
                requestConfirmations,
                callbackGasLimit,
                numWords
        );
    }

    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override {
        s_randomWords = new uint256[](randomWords.length);
    for (uint256 i = 0; i < randomWords.length; i++) {
        s_randomWords[i] = (randomWords[i] % 5) + 1;
    }

    } 


}
