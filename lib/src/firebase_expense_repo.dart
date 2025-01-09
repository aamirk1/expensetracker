import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/src/expense_repo.dart';
import 'package:expensetracker/src/models/category.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');
@override
  Future<void> createCategory( Category category)async{
    try {
    await  categoryCollection.doc(category.categoryId)
    .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }


  @override
  Future<List<Category>> getCategory()async{
    try {
return      await categoryCollection.doc().get().then((value)=>value.docs.map((e) => Category.fromEntity(CantegoryEntity.fromDocument(e.data))).toList());
      
    } catch (e) {
      
    }
  }
}