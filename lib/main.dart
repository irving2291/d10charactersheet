import 'package:d10charactersheet/app/inject_dependencies.dart';
import 'package:d10charactersheet/app/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(
    const MyApp(),
  );
}
