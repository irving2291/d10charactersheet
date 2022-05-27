import 'package:d10charactersheet/app/domain/repositories/authentication_repository.dart';
import 'package:d10charactersheet/app/ui/routes/routes.dart';
import 'package:get_it/get_it.dart';

class SplashController {
  final _authRepository = GetIt.I<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController();

  Future<void> initialize() async {
    final user = await _authRepository.user;
    _routeName = user != null ? Routes.home : Routes.landing;
    if (user != null) {
      print("session correct");
    } else {
      print("session fail");
    }
  }
}