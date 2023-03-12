package com.cashrich.coins.dto;

public class CoinDto {
    private String name;
    private String symbol;
    private double price;
    private int cmcRank;
    private double percentChange24h;

    public CoinDto(String name, String symbol, double price, int cmcRank, double percentChange24h) {
        this.name = name;
        this.symbol = symbol;
        this.price = price;
        this.cmcRank = cmcRank;
        this.percentChange24h = percentChange24h;
    }

    public CoinDto(){};

    public String getName() {
        return name;
    }

    public String getSymbol() {
        return symbol;
    }

    public double getPrice() {
        return price;
    }

    public int getCmcRank() {
        return cmcRank;
    }

    public double getPercentChange24h() {
        return percentChange24h;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setCmcRank(int cmcRank) {
        this.cmcRank = cmcRank;
    }

    public void setPercentChange24h(double percentChange24h) {
        this.percentChange24h = percentChange24h;
    }
}
