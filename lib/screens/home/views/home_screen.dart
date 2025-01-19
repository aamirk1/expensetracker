import 'dart:math';

import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/screens/add_category/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/get_category_bloc/get_categories_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/get_category_bloc/get_categories_event.dart';
import 'package:expensetracker/screens/add_category/blocs/get_expense_bloc/get_expense_bloc.dart';
import 'package:expensetracker/screens/add_category/blocs/get_expense_bloc/get_expense_state.dart';
import 'package:expensetracker/screens/add_expense/views/add_expense.dart';
import 'package:expensetracker/screens/home/views/main_screen.dart';
import 'package:expensetracker/screens/stats/stats.dart';
import 'package:expensetracker/src/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExpenseBloc, GetExpenseState>(
        builder: (context, state) {
      if (state is GetExpenseSuccess) {
        return Scaffold(
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: BottomNavigationBar(
                onTap: (value) {
                  setState(() {
                    index = value;
                  });
                },
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 3,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.home,
                        color: index == 0 ? selectedItem : unselectedItem,
                      ),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        CupertinoIcons.graph_square_fill,
                        color: index == 1 ? selectedItem : unselectedItem,
                      ),
                      label: 'Stats'),
                ]),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.tertiary
                        ],
                        transform: GradientRotation(pi / 4),
                      )),
                  child: Icon(CupertinoIcons.add)),
              onPressed: () async {
                Expense? newExpense = await Navigator.push(
                  context,
                  MaterialPageRoute<Expense>(
                    builder: (BuildContext context) =>
                        MultiBlocProvider(providers: [
                      BlocProvider(
                        create: (context) =>
                            CreateCategoryBloc(FirebaseExpenseRepo()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            GetCategoriesBloc(FirebaseExpenseRepo())
                              ..add(GetCategories()),
                      ),
                      BlocProvider(
                        create: (context) =>
                            CreateExpenseBloc(FirebaseExpenseRepo()),
                      ),
                    ], child: AddExpense()),
                  ),
                );
                if (newExpense != null) {
                  setState(() {
                    state.expenses.insert(0, newExpense);
                  });
                }
              }),
          body: index == 0
              ? MainScreen(
                  expenses: state.expenses,
                )
              : StatsScreen(),
        );
      } else {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
  }
}
