package com.cashrich.coins.response;

import com.cashrich.coins.dto.CoinDto;

import java.util.List;

public class CoinsGetResponse {
    private CoinsGetResponseEnum coinsGetResponseEnum;
    List<CoinDto> coinDtoList;

    public CoinsGetResponse(CoinsGetResponseEnum coinsGetResponseEnum, List<CoinDto> coinDtoList) {
        this.coinsGetResponseEnum = coinsGetResponseEnum;
        this.coinDtoList = coinDtoList;
    }

    public CoinsGetResponseEnum getCoinsGetResponseEnum() {
        return coinsGetResponseEnum;
    }

    public List<CoinDto> getCoinDtoList() {
        return coinDtoList;
    }
}
