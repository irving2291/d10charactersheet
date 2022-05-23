import 'package:d10charactersheet/app/ui/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:meedu/meedu.dart';
import 'package:meedu/state.dart';

final splashProvider = SimpleProvider(
    (_) => SplashController()
);

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SplashController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
