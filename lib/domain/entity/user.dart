class UserEntity {
  final String? id;
  final String phone;
  final String name;
  final String password;
  final int dob;
  final String englishLevel;
  const UserEntity({
    required this.id,
    required this.phone,
    required this.name,
    required this.password,
    required this.dob,
    required this.englishLevel,
  });
}
