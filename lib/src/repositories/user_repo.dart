
import 'package:expensetracker/src/models/models.dart';

abstract class UserRepository {
  Future<void> createUser(User User);

  Future<List<User>> getUser();
}