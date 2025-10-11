import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_cubit.dart';
import 'package:pinput/pinput.dart';

class PinPutOTP extends StatelessWidget {
  const PinPutOTP({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );
    return Pinput(
      length: 6,
      controller: context.read<VerificationCubit>().pinController,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: Colors.deepPurple),
        ),
      ),
     
    );
  }
}
