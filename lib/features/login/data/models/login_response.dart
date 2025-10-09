import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  final String token;
  final String expiresAtUtc;
  final String refreshToken;

 const LoginResponse({required this.token, required this.expiresAtUtc, required this.refreshToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json)=> _$LoginResponseFromJson(json);
}