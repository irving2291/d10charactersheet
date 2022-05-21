import 'package:d10charactersheet/app/domain/repositories/authentication_repository.dart';
import 'package:get_it/get_it.dart';

class SplashController {
  final _authRepository = GetIt.instance<AuthenticationRepository>();

  Future<void> init() async {
    final user = await _authRepository.user;
    if (user != null) {
      print("session correct");
    } else {
      print("session fail");
    }
  }
}