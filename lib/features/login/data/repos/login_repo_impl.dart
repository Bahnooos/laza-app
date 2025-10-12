import 'package:laza_app/core/networking/api_errror_handler.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/core/networking/api_service.dart';
import 'package:laza_app/features/login/data/models/login_request_body.dart';
import 'package:laza_app/features/login/data/models/login_response.dart';

class LoginRepoImpl {
  final ApiService _apiService;

  LoginRepoImpl(this._apiService);

  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final loginResponse = await _apiService.login(loginRequestBody);
      return ApiResult.success(loginResponse);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
