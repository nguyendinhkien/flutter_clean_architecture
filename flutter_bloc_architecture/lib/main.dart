import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/app_injector.dart';
import 'package:flutter_bloc_architecture/presentation/app/index.dart';

void main() async{
  await initInjector();
  runApp(const App());
}


