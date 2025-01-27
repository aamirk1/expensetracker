import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/src/models/category.dart';
import 'package:expensetracker/src/models/expense.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryCollection.get().then((value) => value.docs
          .map((e) => Category.fromEntity(CategoryEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }





  // create expense

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
  
  @override
  Future<List<Expense>> getExpense() async{
    try {
      return await expenseCollection.get().then((value) => value.docs
          .map((e) => Expense.fromEntity(ExpenseEntity.fromDocument(e.data())))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    
  }

  // @override
  // Future<List<Category>> getExpense() async {
  //   try {
  //     return await categoryCollection.get().then((value) => value.docs
  //         .map((e) => Category.fromEntity(CategoryEntity.fromDocument(e.data())))
  //         .toList());
  //   } catch (e) {
  //     log(e.toString());
  //     rethrow;
  //   }
  // }


}
