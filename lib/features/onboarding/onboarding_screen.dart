import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/core/routing/routes.dart';
import 'package:laza_app/core/widgets/custom_elevation_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400.w,
              height: 500.h,
              child: Image.asset(
                'assets/images/onboarding_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomElevationButton(
                label: 'Welcome',
                onPressed: () {
                  context.pushNamed(Routes.loginScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
