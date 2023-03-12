package com.cashrich.aspects.pointcuts;

public class CashRichPointcuts {
    private CashRichPointcuts(){

    }

    public final static String COIN_REST_CALL = "execution(public * com.cashrich.coins.controllers.CoinController.getCoins(..))";
}
