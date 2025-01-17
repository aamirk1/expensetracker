import 'package:equatable/equatable.dart';
import 'package:expensetracker/src/models/category.dart';

sealed class CreateCategoryEvent extends Equatable{
  const CreateCategoryEvent();

  
  @override
  List<Object> get props => [];
}

class CreateCategory extends CreateCategoryEvent{
  final Category category;

  CreateCategory(this.category);
  
  
  @override
  List<Object> get props => [category];
}