import 'package:flutter_bloc_architecture/data/repository/index.dart';
import 'package:flutter_bloc_architecture/domain/repository/index.dart';
import 'package:flutter_bloc_architecture/presentation/app/index.dart';
import 'package:flutter_bloc_architecture/presentation/scenes/login/index.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.asNewInstance();

initInjector() {
  //Bloc
  injector.registerFactory<AppBloc>(() => AppBloc(injector()));
  injector.registerFactory<LoginBloc>(() => LoginBloc());

  injector.registerFactory<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
}
