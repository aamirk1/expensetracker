import 'package:bloc/bloc.dart';
import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/src/models/category.dart';

import 'get_categories_event.dart';
import 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final ExpenseRepository expenseRepository;

  GetCategoriesBloc(this.expenseRepository):super(GetCategoriesInitial()){
    on<GetCategories>((event, emit)async {
      emit(GetCategoriesLoading());
      try {
      List<Category> categories= await expenseRepository.getCategory();
        emit(GetCategoriesSuccess(categories));
      } catch (e) {
        emit(GetCategoriesFailure());
      }
      
    },);
  }
}