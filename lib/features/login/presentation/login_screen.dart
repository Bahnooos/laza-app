import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/styles.dart';
import 'package:laza_app/core/widgets/custom_elevation_button.dart';
import 'package:laza_app/core/widgets/custome_app_bar.dart';
import 'package:laza_app/features/login/presentation/widgets/donnot_have_account.dart';
import 'package:laza_app/features/login/presentation/widgets/email_and_password.dart';

import 'cubit/login_cubit.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CustomeAppBar(hasWishlistIcon: false),
              10.verticalSpace,
              Text('Welcom', style: AppTextStyles.font28BlackBold),
              Text(
                'Please enter your data to continue',
                style: AppTextStyles.font15GrayRegular,
              ),
              80.verticalSpace,
              EmailAndPassword(),
              40.verticalSpace,
              DonnotHaveAccount(),
              20.verticalSpace,
              CustomElevationButton(
                label: 'Login',
                onPressed: () {
                  validateThenDoLogin(context);
                },
              ),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
