import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_app/app.dart';
import 'package:test_app/utils/bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(App());
}