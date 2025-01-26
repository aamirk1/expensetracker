import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/src/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:expensetracker/src/blocs/get_user_bloc/get_user_event.dart';
import 'package:expensetracker/screens/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/get_expense_bloc/get_expense_bloc.dart';
import 'src/blocs/get_expense_bloc/get_expense_event.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: Color(0xFF00B2E7),
          secondary: Color(0xFFE064F7),
          tertiary: Color(0xFFFF8D6C),
          outline: Colors.grey,
        ),
      ),
      home: BlocProvider(
        create: (context) => GetExpenseBloc(FirebaseExpenseRepo())..add(GetExpense()),
        child: HomeScreen()),
    );
  }
}
