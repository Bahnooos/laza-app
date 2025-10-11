import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/styles.dart';
import 'package:laza_app/core/widgets/custom_elevation_button.dart';
import 'package:laza_app/core/widgets/custome_app_bar.dart';
import 'package:laza_app/features/signup/presentation/widgets/username_and_email_and_password.dart';

import 'logic/cubit/sign_up_cubit.dart';
import 'widgets/sign_up_bloc_listener.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomeAppBar(hasWishlistIcon: false),
              20.verticalSpace,
              Text('Sign Up', style: AppTextStyles.font28BlackBold),
              UsernameAndEmailAndPassword(),
              20.verticalSpace,
              CustomElevationButton(
                onPressed: () => validateThenGoToVerification(context),
                label: "Sign Up",
              ),
              SignUpBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenGoToVerification(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
