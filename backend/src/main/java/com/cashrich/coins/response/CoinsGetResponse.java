package com.cashrich.coins.response;

import com.cashrich.coins.dto.CoinDto;

public class CoinsGetResponse {
    private CoinsGetResponseEnum coinsGetResponseEnum;
    CoinDto coinDto;

    public CoinsGetResponse(CoinsGetResponseEnum coinsGetResponseEnum, CoinDto coinDto) {
        this.coinsGetResponseEnum = coinsGetResponseEnum;
        this.coinDto = coinDto;
    }

    public CoinsGetResponseEnum getCoinsGetResponseEnum() {
        return coinsGetResponseEnum;
    }

    public CoinDto getCoinDto() {
        return coinDto;
    }
}
