import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';

class CreateUserUseCase{
  final IUserRepository userRepo;
  CreateUserUseCase(this.userRepo);
  Future<UserEntity> call(UserEntity user) async {
    return await userRepo.createUser(user);
  }
}