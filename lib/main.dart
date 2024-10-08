import 'package:bloc/bloc.dart';
import 'package:bookipedia/app.dart';
import 'package:bookipedia/app/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}
