import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUseCase {
  final IUserRepository userRepo;
  GetUserUseCase(this.userRepo);
  // Future<List<UserEntity>> call() async {
  //   return await userRepo.getListUser();
  // }

  TaskEither<String, List<UserEntity>> call() {
    return TaskEither.tryCatch(
      () async {
        return await userRepo.getListUser();
      },
      (error, stackTrace) => 'Lỗi GetUserUseCase $error',
    );
  }
}
