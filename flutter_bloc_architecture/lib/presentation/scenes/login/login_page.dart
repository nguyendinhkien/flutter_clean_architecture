import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_bloc.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_event.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_page.dart';
import 'package:flutter_bloc_architecture/presentation/base/base_state.dart';
import 'package:flutter_bloc_architecture/presentation/widgets/button/button_widget.dart';

import 'index.dart';

class LoginPage extends BasePage {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginBloc,LoginPage> {
  _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              text: "Login",
              onPressed: () {
                print('Login clicked');
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, BaseBloc<BaseEvent, BaseState> bloc) {
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login Page"),
          ),
          backgroundColor: Colors.white,
          body: _buildBody(),
        );
      },
    );
  }
}
