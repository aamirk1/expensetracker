import 'package:equatable/equatable.dart';

sealed class GetUserEvent extends Equatable {
  const GetUserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends GetUserEvent {}
