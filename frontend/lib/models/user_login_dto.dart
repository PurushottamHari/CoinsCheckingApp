// external
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_login_dto.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class UserLoginDTO {

  @HiveField(0)
  String userName;

  @HiveField(1)
  String password;

  UserLoginDTO({required this.userName, required this.password});

  factory UserLoginDTO.fromJson(Map<String,dynamic> data) => _$UserLoginDTOFromJson(data);

  Map<String,dynamic> toJson() => _$UserLoginDTOToJson(this);

  bool equals(UserLoginDTO other) {
    if(userName == other.userName && password == other.password) {
      return true;
    }
    return false;
  }
}