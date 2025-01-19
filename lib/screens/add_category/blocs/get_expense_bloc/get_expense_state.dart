import 'package:equatable/equatable.dart';
import 'package:expensetracker/src/models/expense.dart';

sealed class GetExpenseState extends Equatable{
  const GetExpenseState();

  @override
  List<Object> get props => [];
}

final class GetExpenseInitial extends GetExpenseState{}
final class GetExpenseFailure extends GetExpenseState{}
final class GetExpenseLoading extends GetExpenseState{}
final class GetExpenseSuccess extends GetExpenseState{
  final List<Expense> expenses;

  const GetExpenseSuccess(this.expenses);
  
  @override
  List<Object> get props => [expenses];
}
