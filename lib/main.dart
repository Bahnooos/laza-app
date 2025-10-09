import 'package:flutter/material.dart';
import 'package:laza_app/core/di/dependency_injection.dart';
import 'package:laza_app/core/routing/app_router.dart';
import 'package:laza_app/laza_app.dart';

void main() {
  setupGetIt();
  runApp(LazaApp(appRouter: AppRouter()));
}
