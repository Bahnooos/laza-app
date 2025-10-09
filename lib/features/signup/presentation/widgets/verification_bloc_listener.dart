import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_cubit.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_state.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_color.dart';

class VerificationBlocListener extends StatelessWidget {
  const VerificationBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listenWhen: (previous, current) =>
          current is VerificationLoading ||
          current is VerificationSuccess ||
          current is VerificationError,
      listener: (context, state) {
        switch (state) {
          case VerificationLoading():
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: AppColor.mainBlueColor),
              ),
            );
          case VerificationSuccess(data: final data):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(' $data'), backgroundColor: Colors.green),
            );
            break;
          case VerificationError(errorMessage: final errorMessage):
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage ?? 'An unknown error occurred.'),
                backgroundColor: Colors.red,
              ),
            );
             context.pushNamed(Routes.loginScreen);
            break;

          default:
        }
      },
      child: SizedBox.shrink(),
  
    );
  }
}
