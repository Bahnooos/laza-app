import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza_app/features/login/presentation/cubit/login_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        switch (state) {
          case LoginLoading():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.mainBlueColor),
              ),
            );
          case LoginSuccess():
    
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('login Successful!'),
                backgroundColor: Colors.green,
              ),
            );

            context.pushNamed(Routes.homeScreen);
            break;
          case LoginError(errorMessage: final errorMessage):
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
