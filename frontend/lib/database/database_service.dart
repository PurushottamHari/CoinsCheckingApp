// external
import 'package:hive_flutter/adapters.dart';

// flutter
import 'package:flutter/material.dart';

// local
import 'package:frontend/models/user_login_dto.dart';

class DatabaseService {

  static bool _isInitialized = false;
  static late DatabaseService dbService;

  final String _boxName = "user-login-data";
  final String MAIN_USER_KEY = "MAIN_USER";

  late Box<UserLoginDTO> _box;

  static Future<DatabaseService> instance() async {
    if(_isInitialized){
      return dbService;
    }
    else{
      dbService = DatabaseService();
      await dbService.initializeHive();
      await dbService.registerAdapters();
      await dbService.openBox();
      return dbService;
    }
  }

  Future<void> initializeHive() async {
    await Hive.initFlutter();
  }

  registerAdapters() {
    if(!_isInitialized) {
      Hive.registerAdapter(UserLoginDTOAdapter());
      _isInitialized = true;
    }
  }

  Future<void> openBox() async {
    if(Hive.isBoxOpen(_boxName)) {
      debugPrint("Reopening the box so closing it first!");
      await close();
    }

    debugPrint("Opening the box!");
    dbService._box = await Hive.openBox(_boxName);
  }

  Future<void> close() async {
    if(Hive.isBoxOpen(_boxName)) {
      debugPrint("Closing the box!");
      await dbService._box.close();
      //_finalizer.detach(this);
    } else {
      debugPrint("Box not open!");
    }
  }

  UserLoginDTO? getUserData() {
    return dbService._box.get(MAIN_USER_KEY);
  }

  Future<void> putUserData(UserLoginDTO userLoginDTO) async {
    debugPrint("Adding ${userLoginDTO.userName} to box!");
    await _box.put(MAIN_USER_KEY, userLoginDTO);
  }
}