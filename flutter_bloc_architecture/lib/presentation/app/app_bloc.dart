import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:flutter_bloc_architecture/domain/repository/authentication_repository.dart';
import 'package:flutter_bloc_architecture/presentation/base/index.dart';

import 'index.dart';

class AppBloc extends BaseBloc {
  AppBloc(this.repository);

  AuthenticationRepository repository;

  @override
  FutureOr<void> mapEventToState(BaseEvent event, Emitter<BaseState> emit) {
    if (event is AppEvent) {
      print('AppLaunched' );
      emit(AppLaunched(AppStatus.authenticated));
    }
  }
}
