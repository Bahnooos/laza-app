import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/networking/api_result.dart';
import 'package:laza_app/features/signup/data/models/verification/verification_request_body.dart';
import 'package:laza_app/features/signup/data/repos/verification_repo_impl.dart';

import 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit(this.verificationRepoImpl)
    : super(VerificationInitialState());
  final VerificationRepoImpl verificationRepoImpl;
  final TextEditingController pinController = TextEditingController();
  Future<void> emitVerificationStates({required String email}) async {
    emit(VerificationLoading());
    final response = await verificationRepoImpl.verifyEmail(
      verificationRequestBody: VerificationRequestBody(
        email: email,
        otp: pinController.text,
      ),
    );
    response.when(
      success: (data) => emit(VerificationSuccess(data: data)),
      failure: (error) => emit(VerificationError(errorMessage: error.message)),
    );
  }
}
