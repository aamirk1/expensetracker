import 'package:expensetracker/src/entities/expense_entity.dart';
import 'package:expensetracker/src/models/category.dart';

class Expense {
  String expenseId;
  Category category;
  DateTime date;
  int amount;
  String userId;

  Expense({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
    required this.userId,
  });

  static final empty =
      Expense(expenseId: '', category: Category.empty, date: DateTime.now(), amount: 0, userId: '');


  ExpenseEntity toEntity() {
    return ExpenseEntity(
      expenseId: expenseId,
      category: category,
      date: date,
      amount: amount,
      userId: userId
    );
  }

  static Expense fromEntity(ExpenseEntity entity) {
    return Expense(
      expenseId: entity.expenseId,
      category: entity.category,
      date: entity.date,
      amount: entity.amount,
      userId: entity.userId,
    );
  }
}



// lib/
//   src/
//     models/
//       expense.dart
//       category.dart
//       user.dart
//     entities/
//       expense_entity.dart
//       category_entity.dart
//       user_entity.dart
//     repositories/
//       expense_repo.dart
//       category_repo.dart
//       user_repo.dart
//     blocs/
//       create_expense_bloc/
//         create_expense_bloc.dart
//         create_expense_event.dart
//         create_expense_state.dart
//       get_expense_bloc/
//         get_expense_bloc.dart
//         get_expense_event.dart
//         get_expense_state.dart
//       create_category_bloc/
//         create_category_bloc.dart
//         create_category_event.dart
//         create_category_state.dart
//       get_category_bloc/
//         get_category_bloc.dart
//         get_category_event.dart
//         get_category_state.dart
//       get_user_bloc/
//         get_user_bloc.dart
//         get_user_event.dart
//         get_user_state.dart
//     screens/
//       home/
//         views/
//           home_screen.dart
//       add_expense/
//         views/
//           add_expense.dart
//       add_category/
//         views/
//           add_category.dart
//       stats/
//         views/
//           stats.dart
//     expense_repository.dart
//     firebase_expense_repo.dart
//   screens/
//     app_view.dart
//     data/
//       data.dart