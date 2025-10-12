import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_app/core/di/dependency_injection.dart';
import 'package:laza_app/features/home/presentation/home_screen.dart';
import 'package:laza_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:laza_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:laza_app/features/login/presentation/login_screen.dart';
import 'package:laza_app/features/onboarding/onboarding_screen.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/sign_up_cubit.dart';
import 'package:laza_app/features/signup/presentation/logic/cubit/verification_cubit.dart';
import 'package:laza_app/features/signup/presentation/sign_up_screen.dart';

import '../../features/signup/presentation/verification_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..emitCategoriesState()..emitProductsStates(),
            child: const HomeScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.verificationScreen:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<VerificationCubit>(),
            child: VerificationScreen(email: args),
          ),
        );

      default:
        return null;
    }
  }
}
