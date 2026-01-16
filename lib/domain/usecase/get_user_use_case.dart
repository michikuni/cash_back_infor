import 'package:cash_back_infor/domain/entity/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';

class GetUserUseCase{
  final IUserRepository userRepo;
  GetUserUseCase(this.userRepo);
  Future<List<UserEntity>> call() async {
    return await userRepo.getListUser();
  }
}