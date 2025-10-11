import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/sign_up_cubit.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/sign_up_state.dart';

import '../../../../core/routing/routes.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoadingState ||
          current is SignUpSuccessState ||
          current is SignUpErrorState,
      listener: (context, state) {
        switch (state) {
          case SignUpLoadingState():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.mainBlueColor),
              ),
            );
          case SignUpSuccessState():
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sign Up Successful!'),
                backgroundColor: Colors.green,
              ),
            );
            final email = context.read<SignUpCubit>().emailController.text;
            context.pushNamed(Routes.verificationScreen, arguments: email);
            break;
          case SignUpErrorState(message: final errorMessage):
            context.pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage ?? 'An unknown error occurred.'),
                backgroundColor: Colors.red,
              ),
            );

            break;

          default:
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
