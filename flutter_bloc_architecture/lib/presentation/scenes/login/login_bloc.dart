import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_event.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_state.dart';

import 'index.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState>{
  @override
  FutureOr<void> mapEventToState(BaseEvent event, Emitter<BaseState> emit) {

  }
}