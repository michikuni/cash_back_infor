import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';
import 'package:fpdart/fpdart.dart';

class CreateUserUseCase {
  final IUserRepository userRepo;
  CreateUserUseCase(this.userRepo);
  // Future<UserEntity> call(UserEntity user) async {
  //   return await userRepo.createUser(user);
  // }
  TaskEither<String, UserEntity> call(UserEntity user) {
    return TaskEither.tryCatch(() async {
      return await userRepo.createUser(user);
    }, (error, stackTrace) => 'Lỗi CreateUserUseCase $error');
  }
}
