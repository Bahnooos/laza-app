import 'package:laza_app/core/networking/api_errror_handler.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/core/networking/api_service.dart';
import 'package:laza_app/features/signup/data/models/verification/verification_request_body.dart';
import 'package:laza_app/features/signup/data/models/verification/verification_response.dart';

class VerificationRepoImpl {
  final ApiService apiService;

  const VerificationRepoImpl(this.apiService);
  Future<ApiResult<VerificationResponse>> verifyEmail({
    required VerificationRequestBody verificationRequestBody,
  }) async {
    try {
      final verificationResponse = await apiService.verifyEmail(
        verificationRequestBody,
      );
      return ApiResult.success(verificationResponse);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
