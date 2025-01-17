import 'package:bloc/bloc.dart';
import 'package:expensetracker/app.dart';
import 'package:expensetracker/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: 'AIzaSyD6e1WZhUQdhpzTXUjBcBv9grav_x_sJOQ',
    appId: '1:765158974989:android:8d760623972388b8a99744',
    messagingSenderId: '765158974989',
    projectId: 'expense-tracker-511a0',
    storageBucket: 'expense-tracker-511a0.firebasestorage.app',
  )
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}



