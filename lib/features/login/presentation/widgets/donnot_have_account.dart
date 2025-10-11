import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/core/routing/routes.dart';
import 'package:laza_app/core/theme/app_color.dart';
import 'package:laza_app/core/theme/styles.dart';

class DonnotHaveAccount extends StatelessWidget {
  const DonnotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: AppTextStyles.font15GrayRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: AppTextStyles.font15GrayRegular.copyWith(
              color: AppColor.mainBlueColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.signupScreen);
              },
          ),
        ],
      ),
    );
  }
}
