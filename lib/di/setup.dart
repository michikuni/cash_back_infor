import 'package:cash_back_infor/data/repositoryImpl/user.dart';
import 'package:cash_back_infor/domain/repository/user.dart';
import 'package:cash_back_infor/domain/usecase/create_user_use_case.dart';
import 'package:cash_back_infor/domain/usecase/get_user_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(baseUrl: 'https://6965eb73f6de16bde44b80bf.mockapi.io')));
  getIt.registerLazySingleton<IUserRepository>(() => UserRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetUserUseCase>(() => GetUserUseCase(getIt()));
  getIt.registerLazySingleton<CreateUserUseCase>(() => CreateUserUseCase(getIt()));
}