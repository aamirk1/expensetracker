import 'package:bloc/bloc.dart';
import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/src/models/expense.dart';

import 'get_expense_event.dart';
import 'get_expense_state.dart';

class GetExpenseBloc extends Bloc<GetExpenseEvent, GetExpenseState> {
  final ExpenseRepository expenseRepository;

  GetExpenseBloc(this.expenseRepository) : super(GetExpenseInitial()) {
    on<GetExpense>(
      (event, emit) async {
        emit(GetExpenseLoading());
        try {
          List<Expense> expenses = await expenseRepository.getExpense();
          emit(GetExpenseSuccess(expenses));
        } catch (e) {
          emit(GetExpenseFailure());
        }
      },
    );
  }
}
