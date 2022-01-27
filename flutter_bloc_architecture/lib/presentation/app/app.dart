import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/app_injector.dart';
import 'package:flutter_bloc_architecture/domain/repository/authentication_repository.dart';
import 'package:flutter_bloc_architecture/presentation/scenes/home/home_page.dart';
import 'package:flutter_bloc_architecture/presentation/scenes/login/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(injector<AuthenticationRepository>()),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late AppBloc appBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appBloc = injector<AppBloc>();
    appBloc.dispatchEvent(AppEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Architecture',
      supportedLocales: const [
        Locale('en', ''),
        Locale('ja', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowBuilder(
        state: AppState,
        onGeneratePages: onGenerateAppPages,
      ),
    );
  }

  List<Page> onGenerateAppPages(state, List<Page> pages) {
    if (state is AppLaunched) print('${state.status}');
    return [
      const MaterialPage(child: LoginPage()),
      if (state is AppLaunched && state.status == AppStatus.authenticated)
        const MaterialPage(child: HomePage()),
      if (state is AppLaunched && state.status == AppStatus.unauthenticated)
        const MaterialPage(child: LoginPage())
    ];
  }
}
