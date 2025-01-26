import 'package:bloc/bloc.dart';
import 'package:expensetracker/expense_repository.dart';
import 'package:expensetracker/src/models/models.dart';
import 'package:expensetracker/src/repositories/user_repo.dart';

import 'get_user_event.dart';
import 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final UserRepository userRepository;

  GetUserBloc(this.userRepository) : super(GetUserInitial()) {
    on<GetUser>(
      (event, emit) async {
        emit(GetUserLoading());
        try {
          List<User> users = await userRepository.getUser();
          emit(GetUserSuccess(users));
        } catch (e) {
          emit(GetUserFailure());
        }
      },
    );
  }
}
