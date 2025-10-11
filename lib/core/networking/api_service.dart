import 'package:dio/dio.dart';
import 'package:laza_app/features/home/data/models/home_categories_model.dart';
import 'package:laza_app/features/home/data/models/products_model.dart';
import 'package:laza_app/features/login/data/models/login_request_body.dart';
import 'package:laza_app/features/login/data/models/login_response.dart';
import 'package:laza_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:laza_app/features/signup/data/models/sign_up_response.dart';
import 'package:laza_app/features/signup/data/models/verification/verification_request_body.dart';
import 'package:laza_app/features/signup/data/models/verification/verification_response.dart';
import 'package:retrofit/retrofit.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.signUpEndpoint)
  Future<SignUpResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);

  @POST(ApiConstants.verifyEmailEndpoint)
  Future<String> verifyEmail(
    @Body() VerificationRequestBody verificationRequestBody,
  );

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @GET(ApiConstants.categoriesEndpoint)
  Future<HomeCategoriesModel> getCategories();

  @GET(ApiConstants.productsEndpoint)
  Future<ProductList> getProducts(
    @Header('page') int page,
    @Header('pageSize') int pageSize,
    
  );
}
