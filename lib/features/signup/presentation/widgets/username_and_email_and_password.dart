import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/widgets/app_text_form_field.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/sign_up_cubit.dart';

class UsernameAndEmailAndPassword extends StatefulWidget {
  const UsernameAndEmailAndPassword({super.key});

  @override
  State<UsernameAndEmailAndPassword> createState() =>
      _UsernameAndEmailAndPasswordState();
}

class _UsernameAndEmailAndPasswordState
    extends State<UsernameAndEmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().userNameController,
            label: 'Username',
            hintText: 'username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid username';
              }
            },
          ),
          20.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().passwordController,
            label: 'Password',
            hintText: 'password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          20.verticalSpace,
          AppTextFormField(
            controller: context.read<SignUpCubit>().emailController,
            label: 'Email',
            hintText: 'email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid Email';
              }
            },
          ),
        ],
      ),
    );
  }
}
