import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/helpers/app_regex.dart';
import 'package:laza_app/core/widgets/app_text_form_field.dart';
import 'package:laza_app/features/login/presentation/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            label: 'Email',
            hintText: 'email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter your valid email';
              }
            },
          ),
          10.verticalSpace,
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            label: 'Password',
            hintText: 'Password',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ) {
                return 'Please enter correct password';
              }
            },
          ),
        ],
      ),
    );
  }
}
