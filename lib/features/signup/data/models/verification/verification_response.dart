import 'package:json_annotation/json_annotation.dart';
part 'verification_response.g.dart';

@JsonSerializable()
class VerificationResponse {
  final String? message;

  const VerificationResponse({required this.message});

  factory VerificationResponse.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseFromJson(json);
}
