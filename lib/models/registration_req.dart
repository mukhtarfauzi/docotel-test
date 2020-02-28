import 'package:json_annotation/json_annotation.dart';

part 'registration_req.g.dart';

@JsonSerializable()
class RegistrationReq {
  String username;
  String fullName;
  String password;


  RegistrationReq({this.username, this.fullName, this.password});

  factory RegistrationReq.fromJson(Map<String, dynamic> json) => _$RegistrationReqFromJson(json);
    Map<String, dynamic> toJson() => _$RegistrationReqToJson(this);
}