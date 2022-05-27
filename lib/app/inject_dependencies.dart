import 'package:d10charactersheet/app/data/repositories_impl/authentication_repository_impl.dart';
import 'package:d10charactersheet/app/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

void injectDependencies() {
  GetIt.I.registerSingleton<AuthenticationRepository>(
    AuthenticationRepositoryImpl(FirebaseAuth.instance),
  );
}