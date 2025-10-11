import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:laza_app/features/signup/data/repos/sign_up_repo_impl.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepoImpl) : super(SignUpInitialState());
  final SignUpRepoImpl signUpRepoImpl;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitSignUpStates() async {
    emit(SignUpLoadingState());
    final signUpResponse = await signUpRepoImpl.signUp(
      signUpRequestBody: SignUpRequestBody(
        email: emailController.text,
        password: passwordController.text,
        firstName: userNameController.text,
        lastName: userNameController.text,
      ),
    );

    signUpResponse.when(
      success: (data) => emit(SignUpSuccessState(data: data)),
      failure: (error) => emit(SignUpErrorState(message: error.message)),
    );
  }
}
