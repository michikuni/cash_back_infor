import 'package:cash_back_infor/domain/entity/user.dart';

abstract class IUserRepository{
  Future<List<UserEntity>> getListUser();
  Future<UserEntity> createUser(UserEntity user);
}