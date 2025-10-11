import 'package:laza_app/core/networking/api_errror_handler.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/core/networking/api_service.dart';
import 'package:laza_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:laza_app/features/signup/data/models/sign_up_response.dart';

class SignUpRepoImpl {
  final ApiService _apiService;

  SignUpRepoImpl(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp({
    required SignUpRequestBody signUpRequestBody,
  }) async {
    try {
      final signUpResponse = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(signUpResponse);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
