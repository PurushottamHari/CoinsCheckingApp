// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserLoginDTOAdapter extends TypeAdapter<UserLoginDTO> {
  @override
  final int typeId = 0;

  @override
  UserLoginDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLoginDTO(
      userName: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserLoginDTO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoginDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginDTO _$UserLoginDTOFromJson(Map<String, dynamic> json) => UserLoginDTO(
      userName: json['userName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginDTOToJson(UserLoginDTO instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };
