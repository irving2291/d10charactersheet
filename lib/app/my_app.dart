import 'package:d10charactersheet/app/ui/routes/app_routes.dart';
import 'package:d10charactersheet/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'd 10 character sheet',
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}