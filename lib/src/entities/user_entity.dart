class UserEntity {
  String userId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  UserEntity({
    required this.userId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'name': name,
      'totalExpenses': totalExpenses,
      'icon': icon,
      'color': color
    };
  }

  static UserEntity fromDocument(Map<String, dynamic> doc) {
    return UserEntity(
        userId: doc['userId'],
        name: doc['name'],
        totalExpenses: doc['totalExpenses'],
        icon: doc['icon'],
        color: doc['color']);
  }
}
