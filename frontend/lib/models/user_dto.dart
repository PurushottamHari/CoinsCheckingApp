// external
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDTO {
  String firstName;
  String lastName;
  String email;
  String userName;
  String password;

  UserDTO({required this.firstName, required this.lastName, required this.email, required this.userName, required this.password});

  factory UserDTO.fromJson(Map<String,dynamic> data) => _$UserDTOFromJson(data);

  Map<String,dynamic> toJson() => _$UserDTOToJson(this);
}