import 'package:equatable/equatable.dart';
import 'package:expensetracker/src/models/models.dart';

sealed class GetUserState extends Equatable {
  const GetUserState();

  @override
  List<Object> get props => [];
}

final class GetUserInitial extends GetUserState {}

final class GetUserFailure extends GetUserState {}

final class GetUserLoading extends GetUserState {}

final class GetUserSuccess extends GetUserState {
  final List<User> users;

  const GetUserSuccess(this.users);

  @override
  List<Object> get props => [users];
}
