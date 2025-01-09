import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/src/models/category.dart';

abstract class ExpenseRepository {
  Future<void> createCategory(Category category);

  Future<List<Category>> getCategory();
}