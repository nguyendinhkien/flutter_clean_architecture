import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_state.dart';
import 'package:rxdart/rxdart.dart';

import 'index.dart';

abstract class BaseBloc<Event extends BaseEvent, State extends BaseState>
    extends Bloc<BaseEvent, BaseState> {
  BaseBloc({BaseState? initialState}) : super(initialState ?? IdlState()){
    on<BaseEvent>(mapEventToState);
  }

  BehaviorSubject<Closeable<BaseState>>? subject;

  void dispose() {
    subject?.close();
  }

  void dispatchEvent(BaseEvent event) {
    super.add(event);
  }

  Future<BaseState> awaitableDispatch(BaseEvent event) async {
    subject = BehaviorSubject();
    subject?.addStream(eventToStateWrapper(event));
    Completer<BaseState> completer = Completer<BaseState>();
    BaseState? lastState;
    subject?.listen((elem) {
      if(elem.isCloseEvent()){
        completer.complete(lastState);
      }
      lastState = elem.item;
    });
    return completer.future;
  }

  Stream<Closeable<BaseState>> eventToStateWrapper(BaseEvent event) async* {
    // yield* mapEventToState(event).map((item) => Closeable(item));
    // yield Closeable<BaseState>(null);
  }

  FutureOr<void> mapEventToState(BaseEvent event, Emitter<BaseState> emit);
}

class Closeable<T> {
  T item;

  Closeable(this.item);

  isCloseEvent() => item == null;
}
