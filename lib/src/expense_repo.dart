
import 'package:expensetracker/src/models/category.dart';
import 'package:expensetracker/src/models/expense.dart';

abstract class ExpenseRepository {
  Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();

  Future<void> createExpense(Expense expense);

  Future<List<Expense>> getExpense();
}