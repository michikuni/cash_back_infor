import 'package:cash_back_infor/domain/entity/user.dart';

class UserModel extends UserEntity {
  UserModel({
    super.id,
    required super.phone,
    required super.password,
    required super.dob,
    required super.englishLevel,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    phone: json['phone'],
    password: json['password'],
    dob: json['dob'],
    englishLevel: json['english-level'],
    name: json['name'],
  );

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'name': name,
    'password': password,
    'dob': dob,
    'english-level': englishLevel,
  };
}
