// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationReq _$RegistrationReqFromJson(Map<String, dynamic> json) {
  return RegistrationReq(
    username: json['username'] as String,
    fullName: json['fullName'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegistrationReqToJson(RegistrationReq instance) =>
    <String, dynamic>{
      'username': instance.username,
      'fullName': instance.fullName,
      'password': instance.password,
    };
