package com.cashrich.coins.service;

import com.cashrich.coins.dto.CoinDto;
import com.cashrich.coins.response.CoinsGetResponse;
import com.cashrich.coins.response.CoinsGetResponseEnum;
import com.cashrich.user.dto.LoginCredentialsDto;
import com.cashrich.user.response.getUser.UserGetResponse;
import com.cashrich.user.response.getUser.UserGetResponseEnum;
import com.cashrich.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class CoinService {

    @Autowired
    UserService userService;

    public CoinsGetResponse getCoins(LoginCredentialsDto loginCredentialsDto){
        try{
            UserGetResponse userGetResponse = userService.getUser(loginCredentialsDto);
            if(userGetResponse == null || userGetResponse.getUserGetResponseEnum() != UserGetResponseEnum.USER_FOUND){
                return new CoinsGetResponse(CoinsGetResponseEnum.USER_AUTH_FAILED, null);
            }

            List<CoinDto> coinDtoList = getCoinsDto();
            if(coinDtoList != null){
                return new CoinsGetResponse(CoinsGetResponseEnum.COINS_FETCHED, coinDtoList);
            }
            else{
                return new CoinsGetResponse(CoinsGetResponseEnum.COINS_FETCH_FAILED, null);
            }

        }
        catch(Exception e) {
            log.error("Exception while fetching coins: " + e.getMessage());
            return new CoinsGetResponse(CoinsGetResponseEnum.COINS_FETCH_FAILED, null);
        }
    }

    private static List<CoinDto> getCoinsDto() throws IOException, JSONException {
        CloseableHttpClient httpClient = HttpClients.createDefault();

        try {

            HttpGet request = new HttpGet("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC");

            // add request headers
            request.addHeader("X-CMC_PRO_API_KEY", "27ab17d1-215f-49e5-9ca4-afd48810c149");

            CloseableHttpResponse response = httpClient.execute(request);

            try {

                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    // return it as a String
                    String result = EntityUtils.toString(entity);
                    JSONObject jsonObject = new JSONObject(result);
                    List<CoinDto> coinDtoList = parseJsonToCoinDtoList(jsonObject.getJSONObject("data"));
                    return coinDtoList;
                }

            } finally {
                response.close();
            }
        } finally {
            httpClient.close();
        }

        return null;
    }

    private static List<CoinDto> parseJsonToCoinDtoList(JSONObject jsonObject) throws JSONException {
        List<CoinDto> result = new ArrayList<>();
        ArrayList<String> coinsList = new ArrayList<>();
        coinsList.add("BTC");
        coinsList.add("ETH");
        coinsList.add("LTC");

        for(String coin : coinsList){
            JSONObject coinJson = jsonObject.getJSONObject(coin);
            String name = coinJson.getString("name");
            String symbol = coinJson.getString("symbol");
            int cmc_rank = coinJson.getInt("cmc_rank");
            JSONObject usdJson = coinJson.getJSONObject("quote").getJSONObject("USD");
            double price = usdJson.getDouble("price");
            double percentageChange24 = usdJson.getDouble("percent_change_24h");
            DecimalFormat df = new DecimalFormat("#.##");
            price = Double.valueOf(df.format(price));
            percentageChange24 = Double.valueOf(df.format(percentageChange24));
            CoinDto coinDto = new CoinDto(name, symbol, price, cmc_rank, percentageChange24);
            result.add(coinDto);
        }

        return result;
    }
}
