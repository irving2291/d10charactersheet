import 'package:d10charactersheet/app/domain/repositories/authentication_repository.dart';
import 'package:d10charactersheet/app/ui/routes/routes.dart';
import 'package:meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  final _authRepository = Get.find<AuthenticationRepository>();

  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    init();
  }

  Future<void> init() async {
    final user = await _authRepository.user;
    _routeName = user != null ? Routes.home : Routes.login;
    if (user != null) {
      print("session correct");
    } else {
      print("session fail");
    }
  }
}