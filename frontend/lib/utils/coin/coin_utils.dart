import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/coin_dto.dart';
import 'package:frontend/models/user_login_dto.dart';
import 'package:frontend/utils/rest_api/endpoints.dart';
import 'package:frontend/utils/rest_api/rest_api.dart';

class CoinUtils{

  static Future<List<CoinDTO>> getCoins() async{
    DatabaseService dbService = await DatabaseService.instance();
    UserLoginDTO? userLoginDTO = dbService.getUserData();
    if(userLoginDTO == null){
      return [];
    }
    return await _getCoinsRestCall(userLoginDTO);
  }

  static Future<List<CoinDTO>> _getCoinsRestCall(UserLoginDTO userLoginDTO) async{
    try{
      String body = json.encode(userLoginDTO.toJson());
      List<dynamic>? jsonListReceived = await RestAPI().getListFromPostCall(Endpoints.GET_COINS_URL, body);
      if(jsonListReceived == null) {
        debugPrint("Get Coins Rest Call returned null!");
        return [];
      }
      return jsonListReceived.map((coinJson) => CoinDTO.fromJson(coinJson)).toList();
    }
    catch(e){
      debugPrint("Get Coins Rest Call failed ${e.toString()}");
      return [];
    }
  }

}