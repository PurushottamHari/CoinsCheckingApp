import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/database/database_service.dart';
import 'package:frontend/models/user_dto.dart';
import 'package:frontend/models/user_login_dto.dart';
import 'package:frontend/utils/rest_api/endpoints.dart';
import 'package:frontend/utils/rest_api/rest_api.dart';

class UserUtils{
  static Future<bool> loginUser(UserLoginDTO userLoginDTO) async{
    try{
      UserDTO? returnedUserDto = await _loginUserRestCall(userLoginDTO);

      if(returnedUserDto == null){
        return false;
      }
      else{
        DatabaseService dbService = await DatabaseService.instance();
        await dbService.putUserData(userLoginDTO);
        return true;
      }
    }
    catch(e){
      debugPrint("Exception occurred in SignUp User ${e.toString()}");
      return false;
    }
  }

  static Future<bool> signUpUser(UserDTO userDTO) async{
    try{
      UserDTO? returnedUserDto = await _signUpUserRestCall(userDTO);
      if(returnedUserDto == null){
        return false;
      }
      else{
        DatabaseService db = await DatabaseService.instance();
        await db.putUserData(userToUserLoginDto(userDTO));
        return true;
      }
    }
    catch(e){
      debugPrint("Exception occurred in SignUp User ${e.toString()}");
      return false;
    }
  }

  static Future<UserDTO?> getUser() async{
    DatabaseService dbService = await DatabaseService.instance();
    UserLoginDTO? userLoginDTO = dbService.getUserData();
    if(userLoginDTO == null){
      return null;
    }
    return await _getUserRestCall(userLoginDTO);
  }

  static UserLoginDTO userToUserLoginDto(UserDTO userDTO){
    return UserLoginDTO(userName: userDTO.userName, password: userDTO.password);
  }

  static Future<UserDTO?> _loginUserRestCall(UserLoginDTO userLoginDTO) async{
    try{
      String body = json.encode(userLoginDTO.toJson());
      dynamic jsonReceived = await RestAPI().getObjectFromPostCall(Endpoints.LOGIN_URL, body);
      UserDTO userDTO = UserDTO.fromJson(jsonReceived);
      return userDTO;
    }
    catch(e){
      debugPrint("Login Rest Call failed ${e.toString()}");
      return null;
    }
  }

  static Future<UserDTO?> _getUserRestCall(UserLoginDTO userLoginDTO) async{
    try{
      String body = json.encode(userLoginDTO.toJson());
      dynamic jsonReceived = await RestAPI().getObjectFromPostCall(Endpoints.GET_USER_URL, body);
      UserDTO userDTO = UserDTO.fromJson(jsonReceived);
      return userDTO;
    }
    catch(e){
      debugPrint("Login Rest Call failed ${e.toString()}");
      return null;
    }
  }

  static Future<UserDTO?> _signUpUserRestCall(UserDTO userDTO) async{
    try{
      String body = json.encode(userDTO.toJson());
      dynamic jsonReceived = await RestAPI().getObjectFromPostCall(Endpoints.SIGN_UP_URL, body);
      UserDTO returnUserDTO = UserDTO.fromJson(jsonReceived);
      return returnUserDTO;
    }
    catch(e){
      debugPrint("Login Rest Call failed ${e.toString()}");
      return null;
    }
  }
}