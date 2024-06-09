pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceFeed {
    AggregatorV3Interface internal LinkpriceFeed;
    AggregatorV3Interface internal ETHpriceFeed;
    AggregatorV3Interface internal BTCpriceFeed;
    constructor() {
        LinkpriceFeed = AggregatorV3Interface(0xc59E3633BAAC79493d908e63626716e204A45EdF);
        ETHpriceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        BTCpriceFeed = AggregatorV3Interface(0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43);
    }

    function getLinkPrice() public view returns (int256) {

        (
            , 
            int256 answer,
            ,
            ,
        ) = LinkpriceFeed.latestRoundData();
        return answer;
    }
     function getETHPrice() public view returns (int256) {

        (
            , 
            int256 answer,
            ,
            ,
        ) = ETHpriceFeed.latestRoundData();
        return answer;
    }
     function getBTCPrice() public view returns (int256) {

        (
            , 
            int256 answer,
            ,
            ,
        ) =BTCpriceFeed.latestRoundData();
        return answer;
    }

}