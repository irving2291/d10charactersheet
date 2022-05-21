

import 'package:d10charactersheet/app/ui/pages/splash/splash_page.dart';
import 'package:flutter/material.dart' show Widget, BuildContext;
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
  Routes.splash: (_) => const SplashPage()
};