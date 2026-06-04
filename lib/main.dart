import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:haya/bloc_observer.dart';
import 'package:haya/haya_app.dart';

void main()async{
  Bloc.observer = MyBlocObserver();
  runApp(const HayaApp());
}
