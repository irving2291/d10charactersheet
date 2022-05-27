

import 'package:d10charactersheet/app/ui/pages/home/home_page.dart';
import 'package:d10charactersheet/app/ui/pages/login/lading_page.dart';
import 'package:d10charactersheet/app/ui/pages/login/login_page.dart';
import 'package:d10charactersheet/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart' show Widget, BuildContext;
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.splash: (_) => const SplashPage(),
  Routes.landing: (_) => const LandingPage(),
  Routes.login: (_) => const LoginPage(),
  Routes.home: (_) => const HomePage()
};