import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laza_app/core/di/dependency_injection.dart';
import 'package:laza_app/core/helpers/extensions.dart';
import 'package:laza_app/core/routing/app_router.dart';
import 'package:laza_app/laza_app.dart';

import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  checkIfisLoggedInUser();
  setupGetIt();
  runApp(LazaApp(appRouter: AppRouter()));
}

Future<void> checkIfisLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecureData(
    key: Constants.accessToken,
  );
  if (!userToken.isNullAndEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
