import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/widgets/app_images.dart';
import 'package:laza_app/core/widgets/custom_elevation_button.dart';
import 'package:laza_app/core/widgets/custome_app_bar.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_cubit.dart';
import 'package:laza_app/features/signup/presentation/widgets/pin_put_o_t_p.dart';

import 'widgets/verification_bloc_listener.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key, required this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeAppBar(hasWishlistIcon: false),
                30.verticalSpace,
                Image.asset(
                  AppImages.verificationImage,
                  width: 225.w,
                  height: 166.h,
                ),
                30.verticalSpace,
                PinPutOTP(),
                60.verticalSpace,
                CustomElevationButton(
                  onPressed: () {
                    context.read<VerificationCubit>().emitVerificationStates(
                      email: email ?? '',
                    );
                  },
                  label: 'Confirm Code',
                ),
                VerificationBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
