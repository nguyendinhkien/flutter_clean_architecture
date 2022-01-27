import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_architecture/app_injector.dart';
import 'package:flutter_bloc_architecture/presentation/app/index.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_event.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_state.dart';

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<B extends BaseBloc<BaseEvent, BaseState>,
    P extends BasePage> extends State<P> {
  late B bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc = injector.get<B>();
    bloc.dispatchEvent(PageInitStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //unfocus when click outside
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: buildBody(context, bloc),
    );
  }

  Widget buildBody(BuildContext context, BaseBloc bloc);
}
