
import 'package:expensetracker/src/entities/entities.dart';

class User {
  String userId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  User({
    required this.userId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  static final empty =
      User(userId: '', name: '', totalExpenses: 0, icon: '', color: 0);

  UserEntity toEntity() {
    return UserEntity(
        userId: userId,
        name: name,
        totalExpenses: totalExpenses,
        icon: icon,
        color: color);
  }

  static User fromEntity(UserEntity entity) {
    return User(
        userId: entity.userId,
        name: entity.name,
        totalExpenses: entity.totalExpenses,
        icon: entity.icon,
        color: entity.color);
  }
}
