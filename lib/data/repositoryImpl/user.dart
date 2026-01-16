import 'package:cash_back_infor/data/models/user.dart';
import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl extends IUserRepository {
  final Dio dio;
  UserRepositoryImpl(this.dio);
  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final userModel = UserModel(
      phone: user.phone,
      password: user.password,
      dob: user.dob,
      englishLevel: user.englishLevel,
      name: user.name,
    );
    final response = await dio.post(
      '/api/users/register/create-user',
      data: userModel.toJson(),
    );
    return UserModel.fromJson(response.data);
  }

  @override
  Future<List<UserEntity>> getListUser() async {
    try {
      final response = await dio.get('//api/users/register/create-user');
      final List data = response.data;
      return data.map((e) {
        try {
          return UserModel.fromJson(e);
        } catch (error) {
          print("Lỗi data $e");
          print("Lỗi hệ thống $error");
          rethrow;
        }
      }).toList();
    } catch (e) {
      print("Lỗi $e");
      rethrow;
    }
  }
}
