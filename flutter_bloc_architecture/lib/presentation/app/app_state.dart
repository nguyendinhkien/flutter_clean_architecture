import 'package:flutter_bloc_architecture/presentation/base/base_state.dart';

abstract class AppState extends BaseState{
}

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppLaunched extends AppState{
  final AppStatus status;

  AppLaunched(this.status);
}
