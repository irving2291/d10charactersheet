import 'package:d10charactersheet/app/inject_dependencies.dart';
import 'package:d10charactersheet/app/my_app.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injectDependencies();
  runApp(
    const MyApp(),
  );
}
