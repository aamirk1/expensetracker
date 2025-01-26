
import 'package:expensetracker/src/models/category.dart';
import 'package:expensetracker/src/models/expense.dart';

abstract class CategoryRepository {
  Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();
}