import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/features/login/data/models/login_request_body.dart';
import 'package:laza_app/features/login/data/repos/login_repo_impl.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepoImpl) : super(LoginInitial());
  final LoginRepoImpl _loginRepoImpl;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> emitLoginStates() async {
    final loginResponse = await _loginRepoImpl.login(
      loginRequestBody: LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    loginResponse.when(
      success: (loginResponse) {
        saveUserToken(
          token: loginResponse.token,
          refreshToken: loginResponse.refreshToken,
        );
        return emit(LoginSuccess(data: loginResponse));
      },
      failure: (error) => emit(LoginError(errorMessage: error.message)),
    );
  }

  Future<void> saveUserToken({String? token, String? refreshToken}) async {
    SharedPrefHelper.setSecureData(
      key: Constants.accessToken,
      value: token ?? '',
    );
    SharedPrefHelper.setSecureData(
      key: Constants.refreshToken,
      value: refreshToken ?? '',
    );
  }
}
