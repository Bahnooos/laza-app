import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/theme/styles.dart';
import 'package:laza_app/core/widgets/custome_app_bar.dart';
import 'package:laza_app/features/login/presentation/widgets/email_and_password.dart';

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
              40.verticalSpace,
              EmailAndPassword(),

            ],
          ),
        ),
      ),
    );
  }
}
