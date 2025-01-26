import 'package:equatable/equatable.dart';

sealed class GetExpenseEvent extends Equatable {
  const GetExpenseEvent();

  @override
  List<Object> get props => [];
}

class GetExpense extends GetExpenseEvent {}
