import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/routing/routes.dart';
import 'package:laza_app/core/theme/app_color.dart';

import 'core/routing/app_router.dart';

class LazaApp extends StatelessWidget {
  const LazaApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backGroundScreenColor,
        ),
        initialRoute: Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
