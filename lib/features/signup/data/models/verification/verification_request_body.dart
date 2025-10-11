import 'package:json_annotation/json_annotation.dart';
part 'verification_request_body.g.dart';

@JsonSerializable()
class VerificationRequestBody {
  final String? email;
  final String? otp;

  VerificationRequestBody({required this.email, required this.otp});

  Map<String, dynamic> toJson() => _$VerificationRequestBodyToJson(this);
}
